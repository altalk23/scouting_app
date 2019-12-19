import 'package:flutter/material.dart';

class InputDataType {
    static const String textBox = "Text Box";
    static const String colorSelector = "Color Selector";
    static const String textSelector = "Text Selector";
    static const String oneUseStopwatch = "One Use Stopwatch";
    static const String checkbox = "Checkbox";
    static const String gridButton = "Grid Button";
}

class InputData {
    final String id;
    final String type;
    final List<String> selection;
    final List<Color> colorSelection;
    final List<List<int>> grid;
    
    InputData({
        this.id,
        this.type,
        this.selection,
        this.colorSelection,
        this.grid,
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
    InputData(
        id: "Cargo Placement",
        type: InputDataType.gridButton,
        selection: [
        
        ],
        grid: [
            []
        ],
    ),
    InputData(
        id: "Hab Climb Time",
        type: InputDataType.oneUseStopwatch,
        selection: [
        
        ],
    ),
    InputData(
        id: "Hab Start Level",
        type: InputDataType.textSelector,
        selection: [
        
        ],
    ),
    InputData(
        id: "Hab End Level",
        type: InputDataType.textSelector,
        selection: [
        
        ],
    ),
    InputData(
        id: "Robot Count",
        type: InputDataType.textSelector,
        selection: [
        
        ],
    ),
    InputData(
        id: "Robot Type",
        type: InputDataType.textSelector,
        selection: [
        
        ],
    ),
    InputData(
        id: "Autonomous Starts With",
        type: InputDataType.textSelector,
        selection: [
        
        ],
    ),
    InputData(
        id: "Crossing The Line",
        type: InputDataType.checkbox,
    ),
    InputData(
        id: "Defense Notes",
        type: InputDataType.textBox,
    ),
    InputData(
        id: "Notes",
        type: InputDataType.textBox,
    ),
];