import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_app/constant.dart';
import 'package:scouting_app/loop_list.dart';
import 'package:scouting_app/screen/main_screen.dart';
import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';
import 'package:scouting_app/widget/custom_scaffold.dart';
import 'package:scouting_app/languagelooplist.dart';

class QRScreen extends StatefulWidget {
    const QRScreen({Key key}) : super(key: key);
    
    @override
    _QRScreen createState() => _QRScreen();
}

class _QRScreen extends State<QRScreen> {
    String qrData = "";
    int _index;
    Future<List<String>> history;
    String fileContent;
    Map<String, LoopList> labelList = new Map<String, LoopList>();

    @override
    void initState() {
        super.initState();
        history = _readFile();
        labelList = getInput(language);
    }
    
    Future get _localPath async {
        final applicationDirectory = await getApplicationDocumentsDirectory();
        return applicationDirectory.path;
    }
    
    Future get _localFile async {
        final path = await _localPath;
        return File("$path/history.txt");
    }
    
    Future<List<String>> _readFile() async {
        try {
            final file = await _localFile;
            fileContent = await file.readAsString();
            List<String> data = new List<String>();
            if (fileContent != "") data = fileContent.split("\t");
            if (data.length > 0) qrData = data[0];
            return data;
        } catch (e) {
            print(e);
            return null;
        }
    }
    
    Future _writeFile(String text) async {
        final file = await _localFile;
        await file.writeAsString("$text");
    }
    
    Widget projectWidget() {
        return FutureBuilder(
            future: history,
            builder: (context, projectData) {
                if (projectData.hasData) {
                    return ListView.builder(
                        itemCount: projectData.data.length + 1,
                        itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(vertical: Constant.padding),
                                child: index != 0
                                        ? new CustomButton(
                                    child: CustomLabel(
                                        "Team " + projectData.data[index - 1].split(",")[0],
                                        fontSize: Constant.mediumFont,
                                    ),
                                    onPressed: () {
                                        setState(() {
                                            _index = index - 1;
                                            qrData = projectData.data[index - 1];
                                        });
                                    },
                                )
                                        : projectData.data.length != 0
                                        ? QrImage(
                                    version: 10,
                                    data: qrData,
                                    size: MediaQuery
                                            .of(context)
                                            .size
                                            .width,
                                    foregroundColor: Color(0xEE111111),
                                )
                                        : Container(),
                            );
                        },
                    );
                } else {
                    return Container();
                }
            },
        );
    }
    
    List<Widget> appBarWidget() {
        return [
            FutureBuilder(
                future: history,
                builder: (context, projectData) {
                    if (projectData.hasData) {
                        return IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                                setState(() {
                                    if (projectData.data.length > 0 && _index != null) {
                                        projectData.data.removeAt(_index);
                                        qrData = projectData.data[_index - 1 > 0 ? _index - 1 : 0];
                                    }
                                });
                                _index = null;
                                _writeFile(projectData.data.join("\t"));
                            },
                        );
                    } else {
                        return Container();
                    }
                },
            ),/*
            FutureBuilder(
                future: history,
                builder: (context, projectData) {
                    if (projectData.hasData) {
                        return IconButton(
                            icon: Icon(Icons.print),
                            onPressed: () {
                                projectData.data.forEach((value) {
                                    print(value);
                                    print("\n\n");
                                });
                            },
                        );
                    } else {
                        return Container();
                    }
                },
            ),*/
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
                                        labelList["qr_help"][0],
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
        ];
    }
    
    @override
    Widget build(BuildContext context) {
        return CustomScaffold(
            title: "QR List",
            actions: appBarWidget(),
            child: projectWidget(),
        );
    }
}
