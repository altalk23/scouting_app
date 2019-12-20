
import 'package:flutter/material.dart';


extension FromColorNaming on String {
    Color color() {
        if (this == "Red") return Colors.red;
        if (this == "Blue") return Colors.blue;
        return Colors.transparent;
    }
}