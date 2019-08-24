import 'package:flutter/material.dart';
import 'package:scouting_app/widget/custom_label.dart';

class Notes extends StatelessWidget {
    Notes({this.label, this.onChanged});
    
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
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(
                        fontSize: 20.0,
                    ),
                    onChanged: onChanged,
                ),
            ],
        );
    }
}