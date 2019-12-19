import 'package:flutter/material.dart';
import 'package:scouting_app/new/custom.dart';

class Input {
    Map<String, String> textBox;
    Map<String, Color> colorSelector;
    Map<String, String> textSelector;
    
}

extension WidgetBuilding on List<InputData> {
    List<Widget> build(BuildContext context, Input input) {
        List<Widget> widgetList = List<Widget>();
        widgetList.add(Padding(
            padding: EdgeInsets.all(8),
            child: RaisedButton(
                onPressed: () {},
            ),
        ));
        this.forEach((data) {
            switch (data.type) {
                case InputDataType.textBox:
                    break;
                case InputDataType.colorSelector:
                    break;
                case InputDataType.textSelector:
                    widgetList.add(Padding(
                        padding: EdgeInsets.all(8),
                        child: DropdownButton<String>(
                            onChanged: (value) {
                            },
                            items: <DropdownMenuItem<String>>[],
                        ),
                    ));
                    break;
                case InputDataType.oneUseStopwatch:
                    break;
                case InputDataType.gridButton:
                    break;
                case InputDataType.checkbox:
                    break;
            }
        });
        return null;
    }
}