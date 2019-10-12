import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';
import 'package:scouting_app/widget/custom_scaffold.dart';

import '../constant.dart';

class QRScreen extends StatefulWidget {
    
    
    const QRScreen({Key key}) : super(key: key);
    
    @override
    _QRScreen createState() => _QRScreen();
}

class _QRScreen extends State<QRScreen> {
    String qrData = "";
    int _index;
    List<String> history;
    
    _QRScreen() {
        _readFile();
    }
    
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
            if (history.length > 0) qrData = history[0];
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
        return CustomScaffold(
            title: "QR List",
            actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                        setState(() {
                            history.removeAt(_index);
                            if (history.length > 0) qrData = history[_index-1];
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
                            size: MediaQuery.of(context).size.width,
                            foregroundColor: Color(0xEE111111),
                        ),
                    );
                },
            ),
        );
    }
    
}

