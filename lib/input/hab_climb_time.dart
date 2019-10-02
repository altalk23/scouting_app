import 'package:flutter/material.dart';
import 'package:scouting_app/loop_list.dart';
import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';

import '../constant.dart';

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
                    fontSize: Constant.mediumFont,
                ),
                SizedBox(
                    height: Constant.padding,
                ),
                CustomButton(
                    child: CustomLabel(
                        counterList[0],
                        fontSize: Constant.smallFont,
                    ),
                    onPressed: onPressed,
                ),
            ],
        );
    }
}