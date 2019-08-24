import 'package:flutter/material.dart';
import 'package:scouting_app/loop_list.dart';
import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';

class HabClimbTime extends StatelessWidget {
    
    HabClimbTime({this.label, this.counterList, this.onPressed});
    
    final String label;
    final LoopList counterList;
    final VoidCallback onPressed;
    
    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                CustomLabel(
                    label,
                    style: TextStyle(
                        fontSize: 28.0,
                    ),
                ),
    
                CustomButton(
                    child: CustomLabel(
                        counterList[0],
                        style: TextStyle(
                            fontSize: 20.0,
                        ),
                    ),
                    onPressed: onPressed,
                ),
            ],
        );
    }
}