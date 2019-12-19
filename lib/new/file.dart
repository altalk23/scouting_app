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

Future<String> readFile() async {
    try {
        final file = await _localFile;
        fileContent = await file.readAsString();
        return fileContent;
    } catch (e) {
        print(e);
        return null;
    }
}

Future writeFile(String text) async {
    final file = await _localFile;
    await file.writeAsString("$text");

}