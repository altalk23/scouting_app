import 'dart:core';

import 'package:flutter/material.dart';
import 'package:scouting_app/loop_list.dart';
import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';

class StopwatchButton extends StatelessWidget {
    StopwatchButton({this.onPressed});
    final VoidCallback onPressed;
    
    LoopList choiceList = new LoopList(['Start the timer', 'End the timer']);
    
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return CustomButton(
            child: CustomLabel(
                choiceList[0],
                style: TextStyle(
                    fontSize: 20.0,
                ),
            ),
            onPressed: onPressed,
        );
    }
    
    @override
    State<StatefulWidget> createState() {
        return null;
    }
}