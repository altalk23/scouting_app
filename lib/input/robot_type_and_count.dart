import 'package:flutter/material.dart';
import 'package:scouting_app/loop_list.dart';
import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';

import '../constant.dart';

class RobotTypeCount extends StatelessWidget {
    RobotTypeCount({this.label, this.typeList, this.onTypePressed, this.countList, this.onCountPressed});
    
    final String label;
    final LoopList typeList, countList;
    final VoidCallback onTypePressed, onCountPressed;
    
    
    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                CustomLabel(
                    label,
                    fontSize: Constant.mediumFont,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                        CustomButton(
                            child: CustomLabel(
                                typeList[0],
                                fontSize: Constant.smallFont,
                            ),
                            onPressed: onTypePressed,
                        ),
                        CustomButton(
                            child: CustomLabel(
                                countList[0],
                                fontSize: Constant.smallFont,
                            ),
                            onPressed: onCountPressed,
                        ),
                    ],
                ),
            ],
        );
    }
}