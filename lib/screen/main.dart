import 'package:flutter/material.dart';
import 'package:scouting_app/custom.dart';
import 'package:scouting_app/decoration.dart';
import 'package:scouting_app/input.dart';
import 'package:scouting_app/labeled_widget.dart';
import 'package:scouting_app/localization.dart';
import 'package:scouting_app/name.dart';


class MainScreen extends StatefulWidget {
    @override
    _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
    Input input = Input();
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
                decoration: scaffoldDecoration(context),
                child: ListView.builder(
                    itemCount: deepspace2019.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                        if (index == 0) return Padding(
                            padding: EdgeInsets.all(16),
                            child: RaisedButton(
                                onPressed: () {},
                            ),
                        );
                        InputData data = deepspace2019[index - 1];
                        Widget result = Placeholder(fallbackHeight: 30,);
                        
                        switch (data.type) {
                            case InputDataType.textBox:
                                result = LabeledWidget(
                                    text: Text(data.id,),
                                    child: TextField(
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) {
                                            input.textBox.putIfAbsent(data.id, () => value);
                                        },
                                    ),
                                );
                                break;
                            case InputDataType.colorSelector:
                                result = LabeledWidget(
                                    text: Text(data.id,),
                                    child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: input.colorSelector[data.id],
                                        onChanged: (value) {
                                            setState(() {
                                                input.colorSelector.putIfAbsent(data.id, () => value);
                                                input.colorSelector[data.id] = value;
                                                print(value);
                                            });
                                        },
                                        items: data.colorSelection.map<DropdownMenuItem<String>>((Color value) {
                                            print(value);
                                            return DropdownMenuItem<String>(
                                              value: value.name(),
                                              child: Text(value.name())
                                            );
                                        }).toList(),
                                    ),
                                );
                                break;
                            case InputDataType.textSelector:
                                result = LabeledWidget(
                                    text: Text(data.id,),
                                    child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: input.textSelector[data.id],
                                        onChanged: (value) {
                                            setState(() {
                                                input.textSelector.putIfAbsent(data.id, () => value);
                                                input.textSelector[data.id] = value;
                                            });
                                        },
                                        items: data.selection.map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                                value: value.lang(Language.en),
                                                child: Text(value.lang(Language.en)),
                                            );
                                        }).toList(),
                                    ),
                                );
                                break;
                            case InputDataType.oneUseStopwatch:
                                int _index = 0;
                                result = LabeledWidget(
                                    text: Text(data.id,),
                                    child: RaisedButton(
                                        onPressed: () {
                                            _index++;
                                        },
                                    ),
                                );
                                break;
                            case InputDataType.gridButton:
                                break;
                            case InputDataType.checkbox:
                                result = Padding(
                                    padding: EdgeInsets.all(16),
                                    child: CheckboxListTile(
                                        title: Text(
                                            data.id,
                                        ),
                                        value: input.checkbox[data.id] ?? false,
                                        onChanged: (bool value) {
                                            setState(() {
                                                input.checkbox[data.id] = value;
                                            });
                                        },
                                    ),
                                );
                                break;
                        }
                        return result;
                    },
                
                ),
            ),
        );
    }
}
