import 'package:flutter/material.dart';
import 'package:scouting_app/widget/custom_label.dart';

import '../constant.dart';

class TeamNumber extends StatelessWidget {
    TeamNumber({this.label, this.onChanged});
    
    final String label;
    final ValueChanged<String> onChanged;
    
    
    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                
                CustomLabel(
                    label,
                    fontSize: Constant.mediumFont,
                ),
                
                TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: Constant.smallFont,
                    ),
                    onChanged: onChanged,
                ),
            ],
        );
    }
}