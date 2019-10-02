import 'package:flutter/material.dart';
import 'package:scouting_app/widget/custom_label.dart';

import '../constant.dart';

class DefenseNotes extends StatelessWidget {
    DefenseNotes({this.label, this.onChanged});
    
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
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(
                        fontSize: Constant.smallFont,
                    ),
                    onChanged: onChanged,
                ),
            ],
        );
    }
}