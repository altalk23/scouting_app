import 'package:flutter/material.dart';
import 'package:scouting_app/loop_list.dart';
import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';
import 'package:scouting_app/constant.dart';

class StopwatchButton extends StatelessWidget {
    StopwatchButton({this.choiceList, this.onPressed});
    
    final VoidCallback onPressed;
    final LoopList choiceList;
    
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return CustomButton(
            child: CustomLabel(
                choiceList[0],
                fontSize: Constant.largeFont,
            ),
            onPressed: onPressed,
        );
    }
}