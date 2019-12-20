
import 'package:flutter/material.dart';

extension ToColorNaming on Color {
    String name() {
        if (this == Colors.red) return "Red";
        if (this == Colors.blue) return "Blue";
        return this.toString();
    }
}

extension FromColorNaming on String {
    Color color() {
        if (this == "Red") return Colors.red;
        if (this == "Blue") return Colors.blue;
        return Colors.transparent;
    }
}