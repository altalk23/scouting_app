import 'package:flutter/material.dart';
import 'package:scouting_app/widget/custom_label.dart';

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
                    style: TextStyle(
                        fontSize: 28.0,
                    ),
                ),
                
                TextField(
                    style: TextStyle(
                        fontSize: 20.0,
                    ),
                    onChanged: onChanged;
                ),
            ],
        );
    }
}