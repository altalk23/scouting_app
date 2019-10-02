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
        return Container(
            decoration: ShapeDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [HSVColor.fromAHSV(1, 313, 0.90, 0.46).toColor(), HSVColor.fromAHSV(1, 313, 0.95, 0.57).toColor()]
                ),
                shape: StadiumBorder(),
            ),
            child: RawMaterialButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                  child: child,
                ),
                onPressed: onPressed,
                shape: StadiumBorder(),
            ),
        );
        /*return RawMaterialButton(
            child: child,
            fillColor: Colors.blue,
            splashColor: Colors.red,
            onPressed: onPressed,
            shape: StadiumBorder(),
        );*/
        /*return RaisedButton(
            onPressed: onPressed,
            child: child,
            color: color,
        );*/
    }
}