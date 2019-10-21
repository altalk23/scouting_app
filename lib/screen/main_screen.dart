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
            actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.help),
                    onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                                return SimpleDialog(
                                    backgroundColor: Color(0x00000000),
                                    title: CustomLabel(
                                        "Help",
                                        fontSize: Constant.mediumFont,
                                    ),
                                    children: <Widget>[
                                        Text(
                                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur euismod ullamcorper dolor, ut interdum mauris elementum sit amet."
                                                    " Vivamus dictum molestie nulla a bibendum. Nulla pretium, sapien eget mollis ullamcorper, velit nulla pulvinar tellus, vitae sollicitudin tortor sem et leo. Vestibulum feugiat vel dui non malesuada. Aliquam varius lectus id tellus tincidunt, at tempus nulla tempor. Sed lacinia convallis sem non congue. Vestibulum eget ligula vitae quam pretium posuere nec et ante. Vivamus id leo ut risus pellentesque ultrices. Praesent sapien nisl, sollicitudin a ultricies et, elementum ut velit. Nulla ex mauris, posuere id posuere vel, auctor sit amet sem.",
                                            softWrap: true,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Constant.smallFont,
                                            ),
                                        )
                                    ],
                                );
                            },
                        );
                    },
                )
            ],
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
