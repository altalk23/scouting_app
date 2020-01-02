import 'package:flutter/material.dart';

MaterialColor swatch() => MaterialColor(
    0xfff451b0,
    <int, Color>{
        50: Color(0xfffce3f2),
        100: Color(0xfff7b8de),
        200: Color(0xfff488c8),
        300: Color(0xfff451b0),
        400: Color(0xfff5039b),
        500: Color(0xfff50084),
        600: Color(0xffe3007f),
        700: Color(0xffcb0079),
        800: Color(0xffb40073),
        900: Color(0xff8b006a),
    },
);

TextStyle titleTextStyle(context) {
    return TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
    );
}


TextStyle mediumTextStyle(context) {
    return TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
    );
}

TextStyle largeTextStyle(context) {
    return TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
    );
}

TextStyle subTextStyle(context) {
    return TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w600
    );
}

TextStyle cardStyle(context) {
    return TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w500,
    );
}

TextStyle textBoxTextStyle(context) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400
    );
}

TextStyle smallTextStyle(context) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400
    );
}