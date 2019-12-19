import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:scouting_app/new/custom.dart';
import 'package:scouting_app/new/localization.dart';

class Input {
    HashMap<String, String> textBox;
    HashMap<String, Color> colorSelector;
    HashMap<String, String> textSelector;
    HashMap<String, Duration> oneUseStopwatch;
    HashMap<String, String> gridButton;
    HashMap<String, bool> checkbox;
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
                                input.textSelector.putIfAbsent(data.id, () => value);
                            },
                            items: data.selection.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                    value: value.lang(Language.en),
                                    child: Text(value.lang(Language.en)),
                                );
                            }),
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