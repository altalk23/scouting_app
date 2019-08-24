import 'package:flutter/material.dart';
import 'package:scouting_app/loop_list.dart';
import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';

class DriverStation extends StatelessWidget {
    DriverStation({this.onColorPressed, this.onAlignmentPressed, this.colorList, this.alignmentList, this.label});
    final VoidCallback onColorPressed, onAlignmentPressed;
    final LoopList colorList, alignmentList;
    final String label;
    
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
    
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                        CustomButton(
                            color: colorList[0],
                            onPressed: onColorPressed,
                        ),
                        CustomButton(
                            child: CustomLabel(
                                alignmentList[0],
                                style: TextStyle(
                                    fontSize: 20.0,
                                ),
                            ),
                            onPressed: onAlignmentPressed,
                        ),
                    ],
                ),
            ],
        );
    }
    
}