import 'package:flutter/material.dart';
import 'package:scouting_app/loop_list.dart';
import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';
import 'package:scouting_app/constant.dart';

class AutonomousStarts extends StatelessWidget {
    AutonomousStarts({this.label, this.autonomousList, this.onPressed, this.isAutonomous});
    
    final String label;
    final LoopList autonomousList;
    final VoidCallback onPressed;
    final bool isAutonomous;
    
    @override
    Widget build(BuildContext context) {
        return isAutonomous
                ? Column(
            children: <Widget>[
                CustomLabel(
                    label,
                    fontSize: Constant.mediumFont,
                ),
                CustomButton(
                        child: CustomLabel(
                            autonomousList[0],
                            fontSize: Constant.smallFont,
                        ),
                        onPressed: onPressed),
            ],
        )
                : Container();
    }
}
