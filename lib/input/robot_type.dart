import 'package:flutter/material.dart';
import 'package:scouting_app/loop_list.dart';
import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';

class RobotType extends StatelessWidget {
    RobotType({this.label, this.typeList, this.onPressed});
    
    final String label;
    final LoopList typeList;
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
                        typeList[0],
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