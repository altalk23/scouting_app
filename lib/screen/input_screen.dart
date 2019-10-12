import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scouting_app/input/autonomous_starts_with.dart';
import 'package:scouting_app/input/cargo.dart';
import 'package:scouting_app/input/crossing_line.dart';
import 'package:scouting_app/input/defense_notes.dart';
import 'package:scouting_app/input/driver_station.dart';
import 'package:scouting_app/input/hab_climb_time.dart';
import 'package:scouting_app/input/hab_start_and_end_level.dart';
import 'package:scouting_app/input/hatch.dart';
import 'package:scouting_app/input/notes.dart';
import 'package:scouting_app/input/robot_type_and_count.dart';
import 'package:scouting_app/input/stopwatch.dart';
import 'package:scouting_app/input/team_number.dart';
import 'package:scouting_app/languagelooplist.dart';
import 'package:scouting_app/loop_list.dart';
import 'package:scouting_app/widget/custom_scaffold.dart';
import 'package:scouting_app/constant.dart';


class InputScreen extends StatefulWidget {
    @override
    _InputScreen createState() => _InputScreen();
}

class _InputScreen extends State<InputScreen> {
    Map<String, LoopList> labelList = new Map<String, LoopList>();
    Map<String, Object> mainMap = new Map<String, Object>();
    Stopwatch stopwatch = new Stopwatch();
    Stopwatch climbStopwatch = new Stopwatch();
    bool crossesLine = false;
    bool isAutonomous = false;
    Future<List<String>> history;
    TextEditingController teamNumber = new TextEditingController();
    TextEditingController notes = new TextEditingController();
    TextEditingController defense = new TextEditingController();
    
    _InputScreen();
    
    void _reset() {
        labelList.forEach((key, value) {
            if (key != 'stopwatch') labelList[key].start = 0;
        });
        mainMap['team_number'] = '';
        mainMap['driver_station_alignment'] = labelList['driver_station_alignment'][0];
        mainMap['driver_station_color'] = labelList['driver_station_color'][0];
        mainMap['hab_start_level'] = labelList['hab_start_level'][0];
        mainMap['hab_end_level'] = labelList['hab_end_level'][0];
        mainMap['hab_climb_time'] = climbStopwatch.elapsed.toString();
        mainMap['cargo_placement_start'] = '';
        mainMap['cargo_placement_duration'] = '';
        mainMap['cargo_placement_place'] = '';
        mainMap['hatch_placement_start'] = '';
        mainMap['hatch_placement_duration'] = '';
        mainMap['hatch_placement_place'] = '';
        mainMap['robot_type'] = labelList['robot_type'][0];
        mainMap['robot_count'] = labelList['robot_count'][0];
        mainMap['crossing_line'] = crossesLine;
        mainMap['autonomous_starts'] = labelList['autonomous_starts'][0];
        mainMap['defense_notes'] = '';
        mainMap['notes'] = '';
        teamNumber.text = "";
        defense.text = "";
        notes.text = "";
    }
    
    String fileContent;
    
    Future get _localPath async {
        final applicationDirectory = await getApplicationDocumentsDirectory();
        return applicationDirectory.path;
    }
    
    Future get _localFile async {
        final path = await _localPath;
        return File("$path/history.txt");
    }
    
    Future<List<String>> _readFile() async {
        try {
            final file = await _localFile;
            fileContent = await file.readAsString();
            List<String> data = new List<String>();
            if (fileContent != "") data = fileContent.split("\t");
            return data;
        }
        catch (e) {
            print(e);
            return null;
        }
    }
    
    Future _writeFile(String text) async {
        final file = await _localFile;
        await file.writeAsString("$text");
        history = _readFile();
    }
    
    // End of struggle
    
    @override
    void initState() {
        super.initState();
        history = _readFile();
        labelList = getInput("tr");
        _reset();
    }
    
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return CustomScaffold(
            actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.print),
                    onPressed: () {
                        mainMap.forEach((key, value) {
                            print(key + ":\n" + value.toString() + "\n\n");
                        });
                    },
                ),
                IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                        _writeFile('');
                    },
                ),
            ],
            title: labelList['title'][0],
            child: FutureBuilder(
                future: history,
                builder: (context, projectData) {
                    if (projectData.hasData) {
                        return ListView(
                            children: <Widget>[
                                //--------------------------------------------------------//
                                Padding(
                                    padding: const EdgeInsets.all(Constant.largePadding),
                                    child: StopwatchButton(
                                        choiceList: labelList['stopwatch'],
                                        onPressed: () {
                                            if (labelList['stopwatch'].start == 0) {
                                                stopwatch.start();
                                            }
                                            else {
                                                stopwatch.stop();
                                                List<Object> list = new List<Object>();
                                                mainMap.forEach((String key, Object value) => list.add(value));
                                                projectData.data.add(list.join(","));
                                                _writeFile(projectData.data.join("\t"));
                                            }
                                            setState(() {
                                                labelList['stopwatch'].loop();
                                                _reset();
                                            });
                                        },
                                    ),
                                ),
                                //--------------------------------------------------------//
                                Padding(
                                    padding: const EdgeInsets.all(Constant.largePadding),
                                    child: TeamNumber(
                                        controller: teamNumber,
                                        label: labelList['team_number'][0],
                                        onChanged: (String string) {
                                            mainMap['team_number'] = string;
                                        },
                                    ),
                                ),
                                //--------------------------------------------------------//
                                Padding(
                                    padding: const EdgeInsets.all(Constant.largePadding),
                                    child: DriverStation(
                                        label: labelList['driver_station'][0],
                                        colorList: labelList['driver_station_color'],
                                        alignmentList: labelList['driver_station_alignment'],
                                        onColorPressed: () {
                                            setState(() {
                                                labelList['driver_station_color'].loop();
                                                mainMap['driver_station_color'] = labelList['driver_station_color'][0];
                                            });
                                        },
                                        onAlignmentPressed: () {
                                            setState(() {
                                                labelList['driver_station_alignment'].loop();
                                                mainMap['driver_station_alignment'] = labelList['driver_station_alignment'][0];
                                            });
                                        },
                                    ),
                                ),
                                //--------------------------------------------------------//
                                Padding(
                                    padding: const EdgeInsets.all(Constant.largePadding),
                                    child: HabClimbTime(
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
                                            });
                                        } : null,
                                    ),
                                ),
                                //--------------------------------------------------------//
                                Padding(
                                    padding: const EdgeInsets.all(Constant.largePadding),
                                    child: HabStartEndLevel(
                                        label: labelList['hab_level'][0],
                                        startList: labelList['hab_start_level'],
                                        endList: labelList['hab_end_level'],
                                        onStartPressed: () {
                                            setState(() {
                                                labelList['hab_start_level'].loop();
                                                mainMap['hab_start_level'] = labelList['hab_start_level'][0];
                                            });
                                        },
                                        onEndPressed: () {
                                            setState(() {
                                                labelList['hab_end_level'].loop();
                                                mainMap['hab_end_level'] = labelList['hab_end_level'][0];
                                            });
                                        },
                                    ),
                                ),
                                //--------------------------------------------------------//
                                Padding(
                                    padding: const EdgeInsets.all(Constant.largePadding),
                                    child: Cargo(
                                        label: labelList['cargo'][0],
                                        dialogLabel: labelList['cargo'][1],
                                        textList: labelList['cargo_state'],
                                        stopwatch: stopwatch,
                                        map: mainMap,
                                    ),
                                ),
                                //--------------------------------------------------------//
                                Padding(
                                    padding: const EdgeInsets.all(Constant.largePadding),
                                    child: Hatch(
                                        label: labelList['hatch'][0],
                                        dialogLabel: labelList['hatch'][1],
                                        textList: labelList['hatch_state'],
                                        stopwatch: stopwatch,
                                        map: mainMap,
                                    ),
                                ),
                                //--------------------------------------------------------//
                                Padding(
                                    padding: const EdgeInsets.all(Constant.largePadding),
                                    child: RobotTypeCount(
                                        label: labelList['robot'][0],
                                        typeList: labelList['robot_type'],
                                        onTypePressed: () {
                                            setState(() {
                                                labelList['robot_type'].loop();
                                                mainMap['robot_type'] = labelList['robot_type'][0];
                                                isAutonomous = labelList['robot_type'].start != 0;
                                            });
                                        },
                                        countList: labelList['robot_count'],
                                        onCountPressed: () {
                                            setState(() {
                                                labelList['robot_count'].loop();
                                                mainMap['robot_count'] = labelList['robot_count'][0];
                                            });
                                        },
                                    ),
                                ),
                                //--------------------------------------------------------//
                                Padding(
                                    padding: const EdgeInsets.all(Constant.largePadding),
                                    child: CrossingLine(
                                        label: labelList['crossing_line'][0],
                                        value: crossesLine,
                                        onChanged: () {
                                            setState(() {
                                                crossesLine = !crossesLine;
                                                mainMap['crossing_line'] = crossesLine;
                                                labelList['crossing_line'].loop();
                                            });
                                        },
                                    ),
                                ),
                                //--------------------------------------------------------//
                                Padding(
                                    padding: const EdgeInsets.all(Constant.largePadding),
                                    child: AutonomousStarts(
                                        label: labelList['autonomous'][0],
                                        autonomousList: labelList['autonomous_starts'],
                                        isAutonomous: isAutonomous,
                                        onPressed: () {
                                            setState(() {
                                                labelList['autonomous_starts'].loop();
                                                mainMap['autonomous_starts'] = labelList['autonomous_starts'][0];
                                            });
                                        },
                                    ),
                                ),
                                //--------------------------------------------------------//
                                Padding(
                                    padding: const EdgeInsets.all(Constant.largePadding),
                                    child: DefenseNotes(
                                        controller: defense,
                                        label: labelList['defense_notes'][0],
                                        onChanged: (String string) {
                                            mainMap['defense_notes'] = string;
                                        },
                                    ),
                                ),
                                //--------------------------------------------------------//
                                Padding(
                                    padding: const EdgeInsets.all(Constant.largePadding),
                                    child: Notes(
                                        controller: notes,
                                        label: labelList['notes'][0],
                                        onChanged: (String string) {
                                            mainMap['notes'] = string;
                                        },
                                    ),
                                ),
                            ],
                        );
                    }
                    else
                        return Container();
                },
            ),
        );
    }
}