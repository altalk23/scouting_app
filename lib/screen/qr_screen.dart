import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';

import '../constant.dart';

class QRScreen extends StatefulWidget {
    
    final List<String> history;
    
    const QRScreen({Key key, this.history}) : super(key: key);
    
    @override
    _QRScreen createState() => _QRScreen(this.history);
}

class _QRScreen extends State<QRScreen> {
    String qrData = "";
    int _index;
    List<String> history;
    
    _QRScreen(this.history);

    String fileContent;

    // Start of struggle

    Future get _localPath async {
        final applicationDirectory = await getApplicationDocumentsDirectory();
        return applicationDirectory.path;
    }

    Future get _localFile async {
        final path = await _localPath;
        return File("$path/history.txt");
    }

    Future _readFile() async {
        try {
            final file = await _localFile;
            fileContent = await file.readAsString();
            history = fileContent.split("\t");
        }
        catch (e) {
            print(e);
            return null;
        }
    }

    Future _writeFile(String text) async {
        final file = await _localFile;
        await file.writeAsString("$text");
    }

    // End of struggle

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: GradientAppBar(
                backgroundColorStart: HSVColor.fromAHSV(1, 313, 0.40, 0.10).toColor(),
                backgroundColorEnd: HSVColor.fromAHSV(1, 313, 0.25, 0.20).toColor(),
                title: CustomLabel(
                    "QR List",
                    fontSize: Constant.titleFont,
                ),
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                            setState(() {
                                history.removeAt(_index);
                            });
                            _index = null;
                            _writeFile(history.join("\t"));
                        },
                    ),
                    IconButton(
                        icon: Icon(Icons.print),
                        onPressed: () {
                            history.forEach((value) {
                                print(value);
                            });
                        },
                    ),
                ],
            ),
            body: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                            HSVColor.fromAHSV(1, 313, 0.40, 0.91).toColor(),
                            HSVColor.fromAHSV(1, 313, 0.25, 0.96).toColor(),
                        ],
                    ),
                ),
                padding: const EdgeInsets.all(Constant.largePadding),
                child: ListView.builder(
                    itemCount: history.length + 1,
                    itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: Constant.padding),
                            child: index != 0 ?
                            new CustomButton(
                                child: CustomLabel(
                                    "Team " + history[index - 1].split(",")[0],
                                    fontSize: Constant.mediumFont,
                                ),
                                onPressed: () {
                                    setState(() {
                                        _index = index - 1;
                                        qrData = history[index - 1];
                                    });
                                },
                            ) :
                            QrImage(
                                version: 10,
                                data: qrData,
                                size: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                foregroundColor: Color(0xEE111111),
                            ),
                        );
                    },
                ),
            ),
        );
    }
    
}

