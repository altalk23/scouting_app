import 'package:flutter/material.dart';

class InputDataType {
    static const String textBox = "Text Box";
    static const String colorSelector = "Color Selector";
    static const String textSelector = "Text Selector";
}

class InputData {
    final String id;
    final String type;
    final List<String> selection;
    final List<Color> colorSelection;
    
    InputData({
        this.id,
        this.type,
        this.selection,
        this.colorSelection,
    });
    
}

List<InputData> deepspace2019 = [
    InputData(
        id: "Team Number",
        type: InputDataType.textBox,
    ),
    InputData(
        id: "Driver Station Color",
        type: InputDataType.colorSelector,
        colorSelection: [
            Colors.red,
            Colors.blue,
        ],
    ),
    InputData(
        id: "Driver Station Alignment",
        type: InputDataType.textSelector,
        selection: [
            
        ],
    ),
];