import 'package:flutter/material.dart';

class StatefulContainer extends StatefulWidget {
    final Widget child;
    
    const StatefulContainer({Key key, this.child}) : super(key: key);
    
    @override
    _StatefulContainerState createState() => _StatefulContainerState();
}

class _StatefulContainerState extends State<StatefulContainer> {
    @override
    Widget build(BuildContext context) {
        return Container(
            child: widget.child,
        );
    }
}
