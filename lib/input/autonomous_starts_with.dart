import 'package:flutter/material.dart';
import 'package:scouting_app/loop_list.dart';
import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';

class AutonomousStarts extends StatelessWidget {
    AutonomousStarts({this.label, this.autonomousList, this.onPressed, this.isAutonomous});
    
    final String label;
    final LoopList autonomousList;
    final VoidCallback onPressed;
    final bool isAutonomous;
    
    @override
    Widget build(BuildContext context) {
        return isAutonomous ? Column(
            children: <Widget>[
                CustomLabel(
                    label,
                    style: TextStyle(
                        fontSize: 28.0,
                    ),
                ),
                CustomButton(
                    child: CustomLabel(
                        autonomousList[0],
                        style: TextStyle(
                            fontSize: 20.0,
                        ),
                    ),
                    onPressed: onPressed
                ),
            ],
        ) : Container();
    }
}