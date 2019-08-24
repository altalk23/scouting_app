import 'dart:core';
import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
    CustomLabel(this.data, {this.style});
    
    final String data;
    final TextStyle style;
    
    @override
    Widget build(BuildContext context) {
        // TODO: implement label
        return Text(
            data,
            style: style,
        );
    }
}