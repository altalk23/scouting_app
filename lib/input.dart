import 'dart:collection';

class Input {
    HashMap<String, String> textBox;
    HashMap<String, String> colorSelector;
    HashMap<String, String> textSelector;
    HashMap<String, Duration> oneUseStopwatch;
    HashMap<String, List<String>> gridButton;
    HashMap<String, List<Duration>> gridButtonDuration;
    HashMap<String, List<Duration>> gridButtonStart;
    HashMap<String, List<Duration>> gridButtonEnd;
    HashMap<String, bool> checkbox;
    
    HashMap<String, int> indexes;
    HashMap<String, Stopwatch> stopwatches;
    
    Input() {
        textBox = HashMap<String, String>();
        colorSelector = HashMap<String, String>();
        textSelector = HashMap<String, String>();
        oneUseStopwatch = HashMap<String, Duration>();
        gridButton = HashMap<String, List<String>>();
        gridButtonDuration = HashMap<String, List<Duration>>();
        gridButtonStart = HashMap<String, List<Duration>>();
        gridButtonEnd = HashMap<String, List<Duration>>();
        checkbox = HashMap<String, bool>();
        
        indexes = HashMap<String, int>();
        stopwatches = HashMap<String, Stopwatch>();
    }
    
    @override
    String toString() {
        return "Data: \n"
          "textBox: ${textBox.toString()}\n"
          "colorSelector: ${colorSelector.toString()}\n"
          "textSelector: ${textSelector.toString()}\n"
          "oneUseStopwatch: ${oneUseStopwatch.toString()}\n"
          "gridButton: ${gridButton.toString()}\n"
          "gridButtonDuration: ${gridButtonDuration.toString()}\n"
          "gridButtonStart: ${gridButtonStart.toString()}\n"
          "gridButtonEnd: ${gridButtonEnd.toString()}\n"
          "checkbox: ${checkbox.toString()}\n\n"
          "Variables: \n"
          "indexes: ${indexes.toString()}\n\n\n"
          "stopwatches: ${stopwatches.toString()}\n\n\n";
    }
    
    
}
