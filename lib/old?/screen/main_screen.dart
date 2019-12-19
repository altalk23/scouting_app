import 'package:flutter/material.dart';
import 'package:scouting_app/loop_list.dart';
import 'package:scouting_app/screen/qr_screen.dart';
import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';
import 'package:scouting_app/widget/custom_scaffold.dart';
import 'package:scouting_app/constant.dart';
import 'package:scouting_app/screen/input_screen.dart';
import 'package:scouting_app/languagelooplist.dart';

String language = "tr";

class MainScreen extends StatefulWidget {
    @override
    _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
    @override
    void initState() {
        super.initState();
        labelList = getInput(language);
    }
    
    Map<String, LoopList> labelList = new Map<String, LoopList>();
    @override
    Widget build(BuildContext context) {
        return CustomScaffold(
            actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.translate),
                    onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                                return SimpleDialog(
                                    backgroundColor: Color(0x00000000),
                                    children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.all(Constant.padding),
                                            child: CustomButton(
                                                child: CustomLabel(
                                                    "TR",
                                                    fontSize: Constant.mediumFont,
                                                ),
                                                onPressed: () {
                                                    setState(() {
                                                        language = "tr";
                                                        labelList = getInput(language);
                                                        Navigator.of(context).pop();
                                                    });
                                                },
                                            ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(Constant.padding),
                                            child: CustomButton(
                                                child: CustomLabel(
                                                    "EN",
                                                    fontSize: Constant.mediumFont,
                                                ),
                                                onPressed: () {
                                                    setState(() {
                                                        language = "en";
                                                        labelList = getInput(language);
                                                        Navigator.of(context).pop();
                                                    });
                                                },
                                            ),
                                        ),
                                    ],
                                );
                            },
                        );
                    },
                ),
                IconButton(
                    icon: Icon(Icons.help),
                    onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                                return SimpleDialog(
                                    backgroundColor: Color(0x00000000),
                                    title: CustomLabel(
                                        labelList["help"][0],
                                        fontSize: Constant.mediumFont,
                                    ),
                                    children: <Widget>[
                                        Text(
                                            labelList["main_help"][0],
                                            softWrap: true,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Constant.helpFont,
                                            ),
                                        )
                                    ],
                                );
                            },
                        );
                    },
                ),
            ],
            title: labelList["title"][1],
            child: ListView(
                children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(Constant.largePadding),
                        child: CustomButton(
                            child: CustomLabel(
                                labelList["title"][0],
                                fontSize: Constant.largeFont,
                            ),
                            onPressed: () {
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
                    Padding(
                        padding: const EdgeInsets.all(Constant.largePadding),
                        child: CustomButton(
                            child: CustomLabel(
                                labelList["title"][2],
                                fontSize: Constant.largeFont,
                            ),
                            onPressed: () {
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
                ],
            ),
        );
    }
}
