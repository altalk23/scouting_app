import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_app/decoration.dart';
import 'package:scouting_app/localization.dart';
import 'package:scouting_app/file.dart';
import 'package:scouting_app/screen/main.dart';
import 'package:scouting_app/style.dart';

class QRScreen extends StatefulWidget {
    @override
    _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
    int selected = 0;
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('QR Screen'.lang(lang)),
            ),
            body: Container(
                decoration: scaffoldDecoration(context),
                child: Center(
                    child: FutureBuilder(
                        future: readFile(),
                        builder: (context, data) {
                            if (data.hasData) {
                                List<String> result2;
                                result2 = data.data.split('/              /\n');
                                return ListView.builder(
                                    itemCount: result2.length,
                                    itemBuilder: (context, index) {
                                        Widget result;
                                        if (index == 0) {
                                            if (selected != 0) {
                                                result = QrImage(
                                                    data: result2[selected],
                                                    version: 20,
                                                );
                                            }
                                            else {
                                                result = AspectRatio(
                                                    aspectRatio: 1,
                                                    child: Placeholder(),
                                                );
                                            }
                                        }
                                        else {
                                            bool f = false;
                                            result2[index].split('\n').forEach((element) {
                                                if (f) {
                                                    f = false;
                                                    result = Card(
                                                        child: Container(
                                                            decoration: cardDecoration(context),
                                                            child: ListTile(
                                                                title: Text(
                                                                    'Team'.lang(lang) + ' #' + element.substring(2),
                                                                    style: mediumTextStyle(context),
                                                                ),
                                                                onTap: () {
                                                                    setState(() {
                                                                        selected = index;
                                                                    });
                                                                },
                                                            ),
                                                        ),
                                                    );
                                                }
                                                if (element == 'Team Number') f = true;
                                            });
                                        }
                                        return result;
                                    },
                                );
                            }
                            return Transform.scale(
                                scale: 2,
                                child: CircularProgressIndicator(),
                            );
                        },
                    ),
                ),
            ),
        );
    }
}
