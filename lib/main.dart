import 'package:flutter/material.dart';
import 'package:scouting_app/screen/main.dart';
import 'package:scouting_app/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: mainTheme(),
            home: MainScreen(),
        );
    }
}

ThemeData mainTheme({
    Color backgroundColor,
    MaterialColor primarySwatch,
    Color accentColor,
    Color highlightColor,
    Color splashColor,
    String fontFamily,
    CardTheme cardTheme,
}) {
    backgroundColor ??= Color(0xffe5def8);
    primarySwatch ??= swatch();
    accentColor ??= Color(0xff9808DB);
    highlightColor ??= Color(0x66bbbbbb);
    splashColor ??= Color(0x88dddddd);
    cardTheme ??= CardTheme(
        margin: EdgeInsets.all(12),
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(12),
            ),
        ),
    );
    fontFamily ??= 'Latin Modern Roman 10';
    
    return ThemeData(
        backgroundColor: backgroundColor,
        primarySwatch: primarySwatch,
        accentColor: accentColor,
        fontFamily: fontFamily,
        cardTheme: cardTheme,
    );
}

