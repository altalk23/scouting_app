import 'dart:core';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_colorpicker/material_picker.dart';

/// Runs the [MyApp] class.
void main() => runApp(MyApp());

/// Initializes the map of [String] keys and [Object] objects.
Map mainMap = new Map<String, Object>();

/// Builds the main state, which contains [MyHomePage] state.
class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
            ),
            home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
    }
}

/// Creates the class [ItemData].
///
/// Contains the parameters [text] and [mapKey].
class ItemData {
    ItemData({this.text, this.mapKey});
    
    final String text;
    final String mapKey;
    
}


class MyHomePage extends StatefulWidget {
    MyHomePage({Key key, this.title}) : super(key: key);
    
    final String title;
    
    @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    //All (?) variable initializations
    Color currentColor = Colors.amber;
    TextEditingController teamNumberTextController = new TextEditingController();
    List<String> alignmentList = ['Left', 'Mid', 'Right'];
    String driverAlignment = 'Left';
    bool crossesLine = false;
    List<String> autonomousList = ['Hatch', 'Cargo', 'Nothing'];
    String autonomousMode = 'Hatch';
    List<Widget> widgetList;
    Stopwatch stopwatch = new Stopwatch();
    bool stopwatchVisible = true;
    List<String> workList = ['Teleop', 'Autonomous', 'Mixed'];
    String workMode = 'Teleop';
    Stopwatch habStopwatch = new Stopwatch();
    String climbTime = 'Start the counter';
    List<List<String>> cargoPlacement = new List<List<String>>();
    List<List<String>> hatchPlacement = new List<List<String>>();
    List<String> cargoList = ['Take Cargo', 'Place Cargo'];
    String cargoText = 'Take Cargo';
    List<String> hatchList = ['Take Hatch', 'Place Hatch'];
    String hatchText = 'Take Hatch';
    List<String> placement = [
        'Left 3a' , null, 'Middle 1a' , null, null, 'Middle 1b' , null, 'Right 3a' ,
        'Left 2a' , null, 'Middle 2a' , null, null, 'Middle 2b' , null, 'Right 2a' ,
        'Left 1a' , null, 'Middle 3a' , null, null, 'Middle 3b' , null, 'Right 1a' ,
        null, null, null, 'Middle 0a' , 'Middle 0b' , null, null, null,
        'Left 1b' , null, null, null, null, null, null, 'Right 1b' ,
        'Left 2b' , null, null, null, null, null, null, 'Right 2b' ,
        'Left 3b' , null, null, null, null, null, null, 'Right 3b' ,
    ];
    List<String> placementName = [
        '3a' , null, '1a' , null, null, '1b' , null, '3a' ,
        '2a' , null, '2a' , null, null, '2b' , null, '2a' ,
        '1a' , null, '3a' , null, null, '3b' , null, '1a' ,
        null, null, null, '0a' , '0b' , null, null, null,
        '1b' , null, null, null, null, null, null, '1b' ,
        '2b' , null, null, null, null, null, null, '2b' ,
        '3b' , null, null, null, null, null, null, '3b' ,
    ];

    _MyHomePageState() {
        mainMap['team_number'] = '';
        mainMap['driver_color'] = currentColor.value.toString();
        mainMap['driver_alignment'] = driverAlignment;
        mainMap['crosses_line'] = crossesLine;
        mainMap['autonomous_mode'] = autonomousMode;
        mainMap['cargo_placement_start'] = '';
        mainMap['cargo_placement_duration'] = '';
        mainMap['cargo_placement_place'] = '';
        mainMap['hatch_placement_start'] = '';
        mainMap['hatch_placement_duration'] = '';
        mainMap['hatch_placement_place'] = '';
        mainMap['work_mode'] = workMode;
        mainMap['start_level'] = 0;
        mainMap['end_level'] = 0;
        mainMap['climb_time'] = new Duration().toString();
        mainMap['robot_count'] = 0;
        mainMap['defense_robot'] = '';
        mainMap['notes'] = '';

        cargoPlacement.add(new List<String>());
        hatchPlacement.add(new List<String>());
        print(widgetList);
    }
    
    @override
    void initState() {
    }
    
    String mapToString(Map<String, Object> map) {
        StringBuffer buffer = new StringBuffer();
        map.forEach((String key, Object value) {
            buffer.write(value.toString());
            buffer.write(", ");
        });
        return buffer.toString();
    }
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Container(
                            constraints: BoxConstraints(
                                maxHeight: MediaQuery.of(context).size.height - 100,
                            ),
                            child: ListView.separated(
                                padding: EdgeInsets.all(16.0),
                                itemBuilder: (context, position) {
                                    widgetList = [
                                        QrImage(
                                            version: 10,
                                            data: mapToString(mainMap),
                                            size: MediaQuery.of(context).size.width,
                                        ),
                                        
                                        Container(
                                            child: stopwatchVisible ? RaisedButton(
                                                child: Text(
                                                    "Start the timer",
                                                    style: TextStyle(
                                                        fontSize: 20.0,
                                                    ),
                                                ),
                                                onPressed: () {
                                                    stopwatch.start();
                                                    setState(() {
                                                      stopwatchVisible = false;
                                                    });
                                                },
                                            ) : new Container(),
                                        ),
                                        // Team Number
    
                                        Text(
                                            'Team Number:',
                                            style: TextStyle(
                                                fontSize: 28.0,
                                            ),
                                        ),
    
                                        TextField(
                                            controller: teamNumberTextController,
                                            style: TextStyle(
                                                fontSize: 20.0,
                                            ),
                                            onChanged: (String str) {
                                                setState(() {
                                                    mainMap['team_number'] = teamNumberTextController.text;
                                                });
                                                print(mainMap.toString());
                                            },
                                        ),
    
                                        // Driver Station
    
                                        Text(
                                            'Driver Station:',
                                            style: TextStyle(
                                                fontSize: 28.0,
                                            ),
                                        ),
    
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                                RaisedButton(
                                                    elevation: 3.0,
                                                    color: currentColor,
                                                    onPressed: () {
                                                        showDialog(
                                                            context: context,
                                                            builder: (BuildContext context) {
                                                                return AlertDialog(
                                                                    titlePadding: const EdgeInsets.all(0.0),
                                                                    contentPadding: const EdgeInsets.all(0.0),
                                                                    content: SingleChildScrollView(
                                                                        child: MaterialPicker(
                                                                            onColorChanged: (Color color) {
                                                                                mainMap['driver_color'] = color.toString();
                                                                                print(mainMap.toString());
                                                                                setState(() {
                                                                                    currentColor = color;
                                                                                    Navigator.of(context).pop();
                                                                                });
                                                                            },
                                                                            pickerColor: currentColor,
                                                                        ),
                                                                    ),
                                                                );
                                                            },
                                                        );
                                                    },
                                                ),
                                                RaisedButton(
                                                    child: Text(
                                                        driverAlignment,
                                                        style: TextStyle(
                                                            fontSize: 20.0,
                                                        ),
                                                    ),
                                                    onPressed: () {
                                                        setState(() {
                                                            driverAlignment =
                                                            alignmentList[(alignmentList.indexOf
                                                                (driverAlignment) + 1) % 3];
                                                        });
                                                        mainMap['driver_alignment'] = driverAlignment;
                                                        print(mainMap.toString());
                                                    },
                                                ),
                                            ],
                                        ),
    
                                        // HAB Start Level
    
                                        Text(
                                            'HAB Start Level:',
                                            style: TextStyle(
                                                fontSize: 28.0,
                                            ),
                                        ),
    
                                        RaisedButton(
                                            child: Text(
                                                mainMap['start_level'].toString(),
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                ),
                                            ),
                                            onPressed: () {
                                                setState(() {
                                                    mainMap['start_level'] = (mainMap['start_level'] + 1) % 4;
                                                });
                                                print(mainMap.toString());
                                            },
                                        ),
    
                                        // Crosses The Line?
    
                                        Row(
                                            children: <Widget>[
                                                Text(
                                                    'Crosses The Line:',
                                                    style: TextStyle(
                                                        fontSize: 28.0,
                                                    ),
                                                ),
    
                                                Checkbox(
                                                    value: crossesLine,
                                                    onChanged: (bool isChanged) {
                                                        setState(() {
                                                            crossesLine = isChanged;
                                                        });
                                                    },
                                                ),
                                            ],
                                        ),
    
                                        // Autonomous begins with
    
                                        Text(
                                            'Autonomous begins with:',
                                            style: TextStyle(
                                                fontSize: 28.0,
                                            ),
                                        ),
    
                                        RaisedButton(
                                            child: Text(
                                                autonomousMode,
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                ),
                                            ),
                                            onPressed: () {
                                                setState(() {
                                                    autonomousMode =
                                                    autonomousList[(autonomousList.indexOf
                                                        (autonomousMode) + 1) % 3];
                                                });
                                                mainMap['autonomous_mode'] = autonomousMode;
                                                print(mainMap.toString());
                                            },
                                        ),
                                        
                                        // Cargo hatch thing
    
                                        Text(
                                            'Cargo time and placement:',
                                            style: TextStyle(
                                                fontSize: 28.0,
                                            ),
                                        ),
    
                                        RaisedButton(
                                            child: Text(
                                                cargoText,
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                ),
                                            ),
                                            onPressed: () {
                                                setState(() {
                                                    cargoText =
                                                    cargoList[(cargoList.indexOf
                                                        (cargoText) + 1) % 2];
                                                    cargoPlacement.last.add(stopwatch.elapsed.inMilliseconds.toString());
                                                    print("added");
                                                    if (cargoText == cargoList[0]) {
                                                        showDialog(
                                                                context: context,
                                                                builder: (BuildContext context) {
                                                                    return SimpleDialog(
                                                                        title: new Text('Set Place'),
                                                                        children: <Widget>[
                                                                            SizedBox(
                                                                                height: 300.0,
                                                                                width: 300.0,
                                                                                child: GridView.count(
                                                                                    crossAxisCount: 8,
                                                                                    children: List.generate(56, (index) {
                                                                                        if (placement[index] != null) {
                                                                                            return RaisedButton(
                                                                                                child: Text(placementName[index]),
                                                                                                onPressed: () {
                                                                                                    cargoPlacement.last.add(placement[index]);
                                                                                                    cargoPlacement.add(new List<String>());
                                                                                                    print(cargoPlacement); // Who needs optimization anyways?
                                                                                                    mainMap['cargo_placement_start'] = '';
                                                                                                    mainMap['cargo_placement_duration'] = '';
                                                                                                    mainMap['cargo_placement_place'] = '';
                                                                                                    cargoPlacement.sublist(0, cargoPlacement.length - 1).forEach((list) {
                                                                                                        mainMap['cargo_placement_start'] = mainMap['cargo_placement_start']
                                                                                                                + '\n' + list[0];
                                                                                                        mainMap['cargo_placement_duration'] = mainMap['cargo_placement_duration']
                                                                                                                + '\n' + list[1];
                                                                                                        mainMap['cargo_placement_place'] = mainMap['cargo_placement_place']
                                                                                                                + '\n' + list[2];
                                                                                                    });
                                                                                                    print(mainMap.toString());
                                                                                                    Navigator.pop(context);
                                                                                                },
                                                                                            );
                                                                                        } else {
                                                                                            return SizedBox(
                                                                                                width: 1.0,
                                                                                                height: 1.0,
                                                                                            );
                                                                                        }
                                                                                    }),
                                                                                ),
                                                                            ),
                                                                        ]
                                                                    );
                                                                }
                                                        );
                                                        cargoPlacement.last[1] = DateTime.fromMillisecondsSinceEpoch
                                                            (int.parse(cargoPlacement.last[1])).difference(DateTime.fromMillisecondsSinceEpoch
                                                            (int.parse(cargoPlacement.last[0]))).toString();
                                                        cargoPlacement.last[0] = Duration(milliseconds: int.parse(cargoPlacement.last[0])).toString();
                                                    }
                                                });
                                            },
                                        ),
    
                                        Text(
                                            'Hatch time and placement:',
                                            style: TextStyle(
                                                fontSize: 28.0,
                                            ),
                                        ),
    
                                        RaisedButton(
                                            child: Text(
                                                hatchText,
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                ),
                                            ),
                                            onPressed: () {
                                                setState(() {
                                                    hatchText =
                                                    hatchList[(hatchList.indexOf
                                                        (hatchText) + 1) % 2];
                                                    hatchPlacement.last.add(stopwatch.elapsed.inMilliseconds.toString());
                                                    print("added");
                                                    if (hatchText == hatchList[0]) {
                                                        showDialog(
                                                                context: context,
                                                                builder: (BuildContext context) {
                                                                    return SimpleDialog(
                                                                            title: new Text('Set Place'),
                                                                            children: <Widget>[
                                                                                SizedBox(
                                                                                    height: 300.0,
                                                                                    width: 300.0,
                                                                                    child: GridView.count(
                                                                                        crossAxisCount: 8,
                                                                                        children: List.generate(56, (index) {
                                                                                            if (placement[index] != null) {
                                                                                                return RaisedButton(
                                                                                                    child: Text(placementName[index]),
                                                                                                    onPressed: () {
                                                                                                        hatchPlacement.last.add(placement[index]);
                                                                                                        hatchPlacement.add(new List<String>());
                                                                                                        print(hatchPlacement); // Who needs optimization anyways?
                                                                                                        mainMap['hatch_placement_start'] = '';
                                                                                                        mainMap['hatch_placement_duration'] = '';
                                                                                                        mainMap['hatch_placement_place'] = '';
                                                                                                        hatchPlacement.sublist(0, hatchPlacement.length - 1).forEach((list) {
                                                                                                            mainMap['hatch_placement_start'] = mainMap['hatch_placement_start']
                                                                                                                    + '\n' + list[0];
                                                                                                            mainMap['hatch_placement_duration'] = mainMap['hatch_placement_duration']
                                                                                                                    + '\n' + list[1];
                                                                                                            mainMap['hatch_placement_place'] = mainMap['hatch_placement_place']
                                                                                                                    + '\n' + list[2];
                                                                                                        });
                                                                                                        print(mainMap.toString());
                                                                                                        Navigator.pop(context);
                                                                                                    },
                                                                                                );
                                                                                            } else {
                                                                                                return SizedBox(
                                                                                                    width: 1.0,
                                                                                                    height: 1.0,
                                                                                                );
                                                                                            }
                                                                                        }),
                                                                                    ),
                                                                                ),
                                                                            ]
                                                                    );
                                                                }
                                                        );
                                                        hatchPlacement.last[1] = DateTime.fromMillisecondsSinceEpoch
                                                            (int.parse(hatchPlacement.last[1])).difference(DateTime.fromMillisecondsSinceEpoch
                                                            (int.parse(hatchPlacement.last[0]))).toString();
                                                        hatchPlacement.last[0] = Duration(milliseconds: int.parse(hatchPlacement.last[0])).toString();
                                                    }
                                                });
                                            },
                                        ),
    
                                        // Teleop or autonomous
    
                                        Text(
                                            'Teleop or autonomous:',
                                            style: TextStyle(
                                                fontSize: 28.0,
                                            ),
                                        ),
    
                                        RaisedButton(
                                            child: Text(
                                                workMode,
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                ),
                                            ),
                                            onPressed: () {
                                                setState(() {
                                                    workMode =
                                                    workList[(workList.indexOf
                                                        (workMode) + 1) % 3];
                                                });
                                                mainMap['work_mode'] = workMode;
                                                print(mainMap.toString());
                                            },
                                        ),
                                        
                                        // Hab end level
    
                                        Text(
                                            'HAB End Level:',
                                            style: TextStyle(
                                                fontSize: 28.0,
                                            ),
                                        ),
    
                                        RaisedButton(
                                            child: Text(
                                                mainMap['end_level'].toString(),
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                ),
                                            ),
                                            onPressed: () {
                                                setState(() {
                                                    mainMap['end_level'] = (mainMap['end_level'] + 1) % 4;
                                                });
                                                print(mainMap.toString());
                                            },
                                        ),
    
                                        // Hab Climb Time
    
                                        Text(
                                            'HAB Climb Time:',
                                            style: TextStyle(
                                                fontSize: 28.0,
                                            ),
                                        ),
    
                                        RaisedButton(
                                            child: Text(
                                                climbTime,
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                ),
                                            ),
                                            onPressed: () {
                                                setState(() {
                                                    if (climbTime == 'Start the counter') {
                                                        climbTime = 'End the counter';
                                                        habStopwatch.start();
                                                    } else {
                                                        habStopwatch.stop();
                                                        climbTime = habStopwatch.elapsed.toString();
                                                        mainMap['climb_time'] = climbTime;
                                                    }
                                                });
                                                print(mainMap.toString());
                                            },
                                        ),
    
                                        // Together with robots
    
                                        Text(
                                            'Together with robots:',
                                            style: TextStyle(
                                                fontSize: 28.0,
                                            ),
                                        ),
    
                                        RaisedButton(
                                            child: Text(
                                                mainMap['robot_count'].toString(),
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                ),
                                            ),
                                            onPressed: () {
                                                setState(() {
                                                    mainMap['robot_count'] = (mainMap['robot_count'] + 1) % 3;
                                                });
                                                print(mainMap.toString());
                                            },
                                        ),
    
                                        // Defense Robot
    
                                        Text(
                                            'Defense Robot:',
                                            style: TextStyle(
                                                fontSize: 28.0,
                                            ),
                                        ),
                                        
                                        TextField(
                                           style: TextStyle(
                                               fontSize: 16.0,
                                           ),
                                            onChanged: (value) {
                                               mainMap['defense_robot'] = value;
                                               print(mainMap.toString());
                                            },
                                        ),
    
                                        // Notes
    
                                        Text(
                                            'Notes:',
                                            style: TextStyle(
                                                fontSize: 28.0,
                                            ),
                                        ),
    
                                        TextField(
                                            style: TextStyle(
                                                fontSize: 16.0,
                                            ),
                                            onChanged: (value) {
                                                mainMap['notes'] = value;
                                                print(mainMap.toString());
                                            },
                                            keyboardType: TextInputType.multiline,
                                            maxLines: null,
                                        ),
                                    ];
                                    return widgetList[position];
                                },
                                itemCount: 27, //TODO: Change this all the time because making it variable
                                // doesn't work
                                separatorBuilder: (context, position) => SizedBox(height: 20.0),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}

