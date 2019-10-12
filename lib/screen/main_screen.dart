import 'package:flutter/material.dart';
import 'package:scouting_app/screen/qr_screen.dart';
import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';
import 'package:scouting_app/widget/custom_scaffold.dart';
import 'package:scouting_app/constant.dart';
import 'package:scouting_app/screen/input_screen.dart';

class MainScreen extends StatefulWidget {
    @override
    _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
    @override
    Widget build(BuildContext context) {
        return CustomScaffold(
            title: "Main Screen",
            child: ListView(
                children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(Constant.largePadding),
                        child: CustomButton(
                            child: CustomLabel(
                                "Input Screen",
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
                                "QR Screen",
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
