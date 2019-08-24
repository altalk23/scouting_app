import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CustomButton extends StatelessWidget {
    CustomButton({@required this.onPressed, this.child, this.color});

    final VoidCallback onPressed;
    final Widget child;
    final Color color;

    @override
    Widget build(BuildContext context) {
        // TODO: implement button
        return RaisedButton(
            onPressed: onPressed,
            child: child,
            color: color,
        );
    }
}