import 'package:flutter/material.dart';
import 'package:scouting_app/decoration.dart';
import 'package:scouting_app/labeled_widget.dart';
import 'package:scouting_app/screen/input.dart';
import 'package:scouting_app/screen/qr.dart';

class MainScreen extends StatefulWidget {
    @override
    _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Main Screen'),
            ),
            body: Container(
                decoration: scaffoldDecoration(context),
                child: Center(
                    child: Column(
                        children: <Widget>[
                            Card(
                                child: Container(
                                    decoration: cardDecoration(context),
                                    child: ListTile(
                                        title: Text('Input Screen'),
                                        onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                                        return InputScreen();
                                                    },
                                                ),
                                            );
                                        },
                                    ),
                                ),
                            ),
                            Card(
                                child: Container(
                                    decoration: cardDecoration(context),
                                    child: ListTile(
                                        title: Text('QR Screen'),
                                        onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                                        return QRScreen();
                                                    },
                                                ),
                                            );
                                        },
                                    ),
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}
