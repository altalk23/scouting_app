import 'dart:core';

import 'package:flutter/material.dart';
import 'package:scouting_app/input/stopwatch.dart';
import 'package:scouting_app/loop_list.dart';

class InputScreen extends StatefulWidget {
    @override
    _InputScreen createState() => _InputScreen();
}

class _InputScreen extends State<InputScreen> {
    Map<String, LoopList> choiceList = new Map<String, LoopList>();
    
    _InputScreen() {
        choiceList['stopwatch'] = new LoopList(['Start the timer', 'End the timer']);
    }
    
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return Scaffold(
            body: Column(
                children: <Widget>[
                    StopwatchButton(
                        choiceList: choiceList['stopwatch'],
                        onPressed: () {
                            setState(() {
                                choiceList['stopwatch'].loop();
                            });
                        },
                    ),
                    
                ],
            ),
        );
    }
}