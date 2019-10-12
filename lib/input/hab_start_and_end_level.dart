import 'package:flutter/material.dart';
import 'package:scouting_app/loop_list.dart';
import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';
import 'package:scouting_app/constant.dart';

class HabStartEndLevel extends StatelessWidget {
    HabStartEndLevel({this.label, this.startList, this.endList, this.onStartPressed, this.onEndPressed});
    
    final String label;
    final LoopList startList, endList;
    final VoidCallback onStartPressed, onEndPressed;
    
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return Column(
            children: <Widget>[
                CustomLabel(
                    label,
                    fontSize: Constant.mediumFont,
                ),
                SizedBox(
                    height: Constant.padding,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                        CustomButton(
                            child: CustomLabel(
                                startList[0],
                                fontSize: Constant.smallFont,
                            ),
                            onPressed: onStartPressed,
                        ),
                        CustomButton(
                            child: CustomLabel(
                                endList[0],
                                fontSize: Constant.smallFont,
                            ),
                            onPressed: onEndPressed,
                        ),
                    ],
                ),
            ],
        );
    }
}