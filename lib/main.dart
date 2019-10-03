import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_app/screen/input_screen.dart';

import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';
/*
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth.dart';*/

/// Runs the [MyApp] class.
void main() => runApp(MyApp());

File historyFile;


List<String> history = new List<String>();

/// Initializes the map of [String] keys and [Object] objects.
Map mainMap = new Map<String, Object>();

/// Builds the main state, which contains [MyHomePage] state.
class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                fontFamily: 'Nunito',
            ),
            home: InputScreen(),
        );
    }
}