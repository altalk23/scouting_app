import 'package:flutter/material.dart';
import 'package:scouting_app/widget/custom_label.dart';

import '../constant.dart';

class DefenseNotes extends StatelessWidget {
    DefenseNotes({this.label, this.onChanged, this.controller});
    
    final String label;
    final ValueChanged<String> onChanged;
    final TextEditingController controller;


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
                    controller: controller,
                ),
            ],
        );
    }
}