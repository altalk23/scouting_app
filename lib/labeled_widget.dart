import 'package:flutter/material.dart';

class LabeledWidget extends StatelessWidget {
    final Widget child;
    final Widget text;
    final EdgeInsets padding;
    
    const LabeledWidget({Key key, this.text, this.padding, this.child}) : super(key: key);
    
    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: padding ?? EdgeInsets.all(24),
            child: Column(
                children: <Widget>[
                    text,
                    SizedBox(height: 16,),
                    child,
                ],
            ),
        );
    }
}
