import 'dart:core';

import 'package:flutter/material.dart';
import 'package:scouting_app/input/autonomous_starts_with.dart';
import 'package:scouting_app/input/cargo.dart';
import 'package:scouting_app/input/crossing_line.dart';
import 'package:scouting_app/input/defense_notes.dart';
import 'package:scouting_app/input/driver_station.dart';
import 'package:scouting_app/input/hab_climb_time.dart';
import 'package:scouting_app/input/hab_start_and_end_level.dart';
import 'package:scouting_app/input/notes.dart';
import 'package:scouting_app/input/robot_type_and_count.dart';

import 'package:scouting_app/input/stopwatch.dart';
import 'package:scouting_app/input/team_number.dart';
import 'package:scouting_app/loop_list.dart';


class InputScreen extends StatefulWidget {
    @override
    _InputScreen createState() => _InputScreen();
}

class _InputScreen extends State<InputScreen> {
    // All text goes in this map
    Map<String, LoopList> labelList = new Map<String, LoopList>();
    
    // All inputs go in this map
    Map<String, Object> mainMap = new Map<String, Object>();
    
    // Main stopwatch used for tracking time
    Stopwatch stopwatch = new Stopwatch();
    
    // Hab climb stopwatch
    Stopwatch climbStopwatch = new Stopwatch();
    
    // Does it crosses the line
    bool crossesLine = false;
    
    // Is it autonomous
    bool isAutonomous = false;
    
    _InputScreen() {
        // All text initializations
        labelList['stopwatch'] = new LoopList(['Start the timer', 'End the timer']);
        labelList['team_number'] = new LoopList(['Team number']);
        labelList['driver_station'] = new LoopList(['Driver alignment']);
        labelList['driver_station_alignment'] = new LoopList(['Left', 'Middle', 'Right']);
        labelList['driver_station_color'] = new LoopList([Colors.red, Colors.blue]);
        labelList['hab_level'] = new LoopList(['Hab start and end level']);
        labelList['hab_start_level'] = new LoopList(['0', '1', '2', '3']);
        labelList['hab_end_level'] = new LoopList(['0', '1', '2', '3']);
        labelList['hab_climb'] = new LoopList(['Hab climb time']);
        labelList['hab_climb_time'] = new LoopList(['Start the counter', 'End the counter', '%counter']);
        labelList['cargo'] = new LoopList(['Cargo placement']);
        labelList['cargo_state'] = new LoopList(['Take cargo', 'Place cargo']);
        labelList['robot'] = new LoopList(['Robot type and count']);
        labelList['robot_type'] = new LoopList(['Teleop', 'Autonomous', 'Mixed']);
        labelList['robot_count'] = new LoopList(['1', '2', '3']);
        labelList['crossing_line'] = new LoopList(['Does it cross the line']);
        labelList['autonomous'] = new LoopList(['Autonomous starts with']);
        labelList['autonomous_starts'] = new LoopList(['Cargo', 'Hatch', 'Mixed']);
        labelList['defense_notes'] = new LoopList(['Defense notes']);
        labelList['notes'] = new LoopList(['Notes']);
        
        // All map initializations
        mainMap['team_number'] = '';
        mainMap['driver_station_alignment'] = labelList['driver_station_alignment'][0];
        mainMap['driver_station_color'] = labelList['driver_station_color'][0];
        mainMap['hab_start_level'] = labelList['hab_start_level'][0];
        mainMap['hab_end_level'] = labelList['hab_end_level'][0];
        mainMap['hab_climb_time'] = climbStopwatch.elapsed.toString();
        mainMap['cargo_placement_start'] = '';
        mainMap['cargo_placement_duration'] = '';
        mainMap['cargo_placement_place'] = '';
        mainMap['robot_type'] = labelList['robot_type'][0];
        mainMap['robot_count'] = labelList['robot_count'][0];
        mainMap['crossing_line'] = crossesLine;
        mainMap['autonomous_starts'] = labelList['autonomous_starts'][0];
        mainMap['defense_notes'] = '';
        mainMap['notes'] = '';
    }
    
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return Scaffold(
            body: ListView(
                children: <Widget>[
                    //--------------------------------------------------------//
                    StopwatchButton(
                        choiceList: labelList['stopwatch'],
                        onPressed: () {
                            if (labelList['stopwatch'].start == 0) {
                                stopwatch.start();
                            }
                            else {
                                stopwatch.stop();
                                // TODO: Add resetting the screen
                            }
                            setState(() {
                                labelList['stopwatch'].loop();
                            });
                        },
                    ),
                    //--------------------------------------------------------//
                    TeamNumber(
                        label: labelList['team_number'][0],
                        onChanged: (String string) {
                            mainMap['team_number'] = string;
                            print(mainMap.toString());
                        },
                    ),
                    //--------------------------------------------------------//
                    DriverStation(
                        label: labelList['driver_station'][0],
                        colorList: labelList['driver_station_color'],
                        alignmentList: labelList['driver_station_alignment'],
                        onColorPressed: () {
                            setState(() {
                                labelList['driver_station_color'].loop();
                                mainMap['driver_station_color'] = labelList['driver_station_color'][0];
                                print(mainMap.toString());
                            });
                        },
                        onAlignmentPressed: () {
                            setState(() {
                                labelList['driver_station_alignment'].loop();
                                mainMap['driver_station_alignment'] = labelList['driver_station_alignment'][0];
                                print(mainMap.toString());
                            });
                        },
                    ),
                    //--------------------------------------------------------//
                    HabClimbTime(
                        label: labelList['hab_climb'][0],
                        counterList: labelList['hab_climb_time'],
                        onPressed: (labelList['hab_climb_time'].start != 2) ? () {
                            if (labelList['hab_climb_time'].start == 0) {
                                climbStopwatch.start();
                            }
                            else if (labelList['hab_climb_time'].start == 1) {
                                climbStopwatch.stop();
                                mainMap['hab_climb_time'] = climbStopwatch.elapsed.toString();
                                labelList['hab_climb_time'][1] = mainMap['hab_climb_time'];
                            }
                            setState(() {
                                labelList['hab_climb_time'].loop();
                                print(mainMap.toString());
                            });
                        } : null,
                    ),
                    //--------------------------------------------------------//
                    HabStartEndLevel(
                        label: labelList['hab_level'][0],
                        startList: labelList['hab_start_level'],
                        endList: labelList['hab_end_level'],
                        onStartPressed: () {
                            setState(() {
                                labelList['hab_start_level'].loop();
                                print(mainMap.toString());
                            });
                        },
                        onEndPressed: () {
                            setState(() {
                                labelList['hab_end_level'].loop();
                                print(mainMap.toString());
                            });
                        },
                    ),
                    //--------------------------------------------------------//
                    Cargo(
                        onPressed: () {},
                        label: labelList['cargo'][0],
                        textList: labelList['cargo_state'],
                        stopwatch: stopwatch,
                        map: mainMap,
                    ),
                    //--------------------------------------------------------//
                    RobotTypeCount(
                        label: labelList['robot'][0],
                        typeList: labelList['robot_type'],
                        onTypePressed: () {
                            setState(() {
                                labelList['robot_type'].loop();
                                mainMap['robot_type'] = labelList['robot_type'][0];
                                print(mainMap.toString());
                                isAutonomous = labelList['robot_type'].start != 0;
                            });
                        },
                        countList: labelList['robot_count'],
                        onCountPressed: () {
                            setState(() {
                                labelList['robot_count'].loop();
                                mainMap['robot_count'] = labelList['robot_count'][0];
                                print(mainMap.toString());
                            });
                        },
                    ),
                    //--------------------------------------------------------//
                    CrossingLine(
                        label: labelList['crossing_line'][0],
                        value: crossesLine,
                        onChanged: (bool value) {
                            setState(() {
                                crossesLine = value;
                                mainMap['crossing_line'] = crossesLine;
                                labelList['crossing_line'].loop();
                                print(mainMap.toString());
                            });
                        },
                    ),
                    //--------------------------------------------------------//
                    AutonomousStarts(
                        label: labelList['autonomous'][0],
                        autonomousList: labelList['autonomous_starts'],
                        isAutonomous: isAutonomous,
                        onPressed: () {
                            setState(() {
                                labelList['autonomous_starts'].loop();
                                mainMap['autonomous_starts'] = labelList['autonomous_starts'][0];
                                print(mainMap.toString());
                            });
                        },
                    ),
                    //--------------------------------------------------------//
                    DefenseNotes(
                        label: labelList['defense_notes'][0],
                        onChanged: (String string) {
                            mainMap['defense_notes'] = string;
                            print(mainMap.toString());
                        },
                    ),
                    //--------------------------------------------------------//
                    Notes(
                        label: labelList['notes'][0],
                        onChanged: (String string) {
                            mainMap['notes'] = string;
                            print(mainMap.toString());
                        },
                    ),
                ],
            ),
        );
    }
}