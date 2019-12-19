import 'dart:io';

import 'package:path_provider/path_provider.dart';

String fileContent;

Future get _localPath async {
    final applicationDirectory = await getApplicationDocumentsDirectory();
    return applicationDirectory.path;
}

Future get _localFile async {
    final path = await _localPath;
    return File("$path/history.txt");
}

Future<String> _readFile() async {
    try {
        final file = await _localFile;
        fileContent = await file.readAsString();
        //List<String> data = new List<String>();
        //if (fileContent != "") data = fileContent.split("\t");
        return fileContent;
    } catch (e) {
        print(e);
        return null;
    }
}

Future _writeFile(String text) async {
    final file = await _localFile;
    await file.writeAsString("$text");
    //history = _readFile();
}