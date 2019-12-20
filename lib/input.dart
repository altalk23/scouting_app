import 'dart:collection';
import 'package:flutter/material.dart';

class Input {
    HashMap<String, String> textBox;
    HashMap<String, String> colorSelector;
    HashMap<String, String> textSelector;
    HashMap<String, Duration> oneUseStopwatch;
    HashMap<String, String> gridButton;
    HashMap<String, bool> checkbox;
    
    Input() {
        textBox = HashMap<String, String>();
        colorSelector = HashMap<String, String>();
        textSelector = HashMap<String, String>();
        oneUseStopwatch = HashMap<String, Duration>();
        gridButton = HashMap<String, String>();
        checkbox = HashMap<String, bool>();
    }
    
    @override
    String toString() {
        return "textSelector:${textSelector.toString()}";
    }
    
    
}
