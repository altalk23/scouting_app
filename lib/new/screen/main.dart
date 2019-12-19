import 'package:flutter/material.dart';
import 'package:scouting_app/new/custom.dart';
import 'package:scouting_app/new/decoration.dart';
import 'package:scouting_app/new/input.dart';

class MainScreen extends StatefulWidget {
    @override
    _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
                decoration: scaffoldDecoration(context),
                child: ListView(
                    children: deepspace2019.build(context),
                ),
            ),
        );
    }
}
