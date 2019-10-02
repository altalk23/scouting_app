import 'package:flutter/material.dart';
import 'package:scouting_app/widget/custom_checkbox.dart';
import 'package:scouting_app/widget/custom_label.dart';

import '../constant.dart';

class CrossingLine extends StatelessWidget {
    CrossingLine({this.label, this.value, this.onChanged});
    final String label;
    final bool value;
    final VoidCallback onChanged;
    
    
    @override
    Widget build(BuildContext context) {
        print("sdafsa"+value.toString());
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                CustomLabel(
                    label,
                    fontSize: Constant.mediumFont,
                ),
                CustomCheckbox(
                    value: value,
                    onChanged: onChanged,
                ),
            ],
        );
    }
}