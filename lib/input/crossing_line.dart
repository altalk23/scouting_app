import 'package:flutter/material.dart';
import 'package:scouting_app/widget/custom_label.dart';

class CrossingLine extends StatelessWidget {
    CrossingLine({this.label, this.value, this.onChanged});
    final String label;
    final bool value;
    final ValueChanged<bool> onChanged;
    
    
    @override
    Widget build(BuildContext context) {
        return Row(
            children: <Widget>[
                CustomLabel(
                    label,
                    style: TextStyle(
                        fontSize: 28.0,
                    ),
                ),
        
                Checkbox(
                    value: value,
                    onChanged: onChanged,
                ),
            ],
        );
    }
}