import 'package:flutter/material.dart';
import 'package:scouting_app/loop_list.dart';
import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';

List<String> placement = [
    'Left 3a', null, 'Middle 1a', null, null, 'Middle 1b', null, 'Right 3a',
    'Left 2a', null, 'Middle 2a', null, null, 'Middle 2b', null, 'Right 2a',
    'Left 1a', null, 'Middle 3a', null, null, 'Middle 3b', null, 'Right 1a',
    null, null, null, 'Middle 0a', 'Middle 0b', null, null, null,
    'Left 1b', null, null, null, null, null, null, 'Right 1b',
    'Left 2b', null, null, null, null, null, null, 'Right 2b',
    'Left 3b', null, null, null, null, null, null, 'Right 3b',
];
List<String> placementName = [
    '3a', null, '1a', null, null, '1b', null, '3a',
    '2a', null, '2a', null, null, '2b', null, '2a',
    '1a', null, '3a', null, null, '3b', null, '1a',
    null, null, null, '0a', '0b', null, null, null,
    '1b', null, null, null, null, null, null, '1b',
    '2b', null, null, null, null, null, null, '2b',
    '3b', null, null, null, null, null, null, '3b',
];

class Cargo extends StatefulWidget {
    Cargo({this.onPressed, this.label, this.textList, this.stopwatch});
    
    final VoidCallback onPressed;
    final String label;
    final LoopList textList;
    final Stopwatch stopwatch;
    
    @override
    State createState() {
        return new _Cargo(this.onPressed, this.label, this.textList, this.stopwatch);
    }
}

class _Cargo extends State<Cargo> {
    final VoidCallback onPressed;
    final String label;
    final LoopList textList;
    final Stopwatch stopwatch;

    _Cargo(this.onPressed, this.label, this.textList, this.stopwatch);
    
    
    List<List<String>> cargoPlacement = new List<List<String>>();
    
    
    Widget _buttonPressed(index) {
        return CustomButton(
            child: CustomLabel(placementName[index]),
            onPressed: () {
                cargoPlacement.last.add(placement[index]);
                cargoPlacement.add(new List<String>());
                print(cargoPlacement); // Who needs optimization anyways?
                mainMap['cargo_placement_start'] = '';
                mainMap['cargo_placement_duration'] = '';
                mainMap['cargo_placement_place'] = '';
                cargoPlacement.sublist(0, cargoPlacement.length - 1)
                        .forEach((list) {
                    mainMap['cargo_placement_start'] =
                            mainMap['cargo_placement_start']
                                    + '\n' + list[0];
                    mainMap['cargo_placement_duration'] =
                            mainMap['cargo_placement_duration']
                                    + '\n' + list[1];
                    mainMap['cargo_placement_place'] =
                            mainMap['cargo_placement_place']
                                    + '\n' + list[2];
                });
                print(mainMap.toString());
                Navigator.pop(context);
            },
        );
    }
    
    void _cargoMenu() {
        textList.loop();
        cargoPlacement.last.add(stopwatch.elapsed.inMilliseconds.toString());
        print("added");
        if (textList.start == 0) {
            showDialog(
                    context: context,
                    builder: (BuildContext context) {
                        return SimpleDialog(
                                title: new CustomLabel('Set Place'),
                                children: <Widget>[
                                    SizedBox(
                                        height: 300.0,
                                        width: 300.0,
                                        child: GridView.count(
                                            crossAxisCount: 8,
                                            children: List.generate(56, (index) {
                                                if (placement[index] != null) {
                                                    return _buttonPressed(index);
                                                }
                                                else {
                                                    return SizedBox(
                                                        width: 1.0,
                                                        height: 1.0,
                                                    );
                                                }
                                            }),
                                        ),
                                    ),
                                ]
                        );
                    }
            );
            cargoPlacement.last[1] = DateTime.fromMillisecondsSinceEpoch(
                    int.parse(cargoPlacement.last[1]))
                    .difference(DateTime.fromMillisecondsSinceEpoch(
                    int.parse(cargoPlacement.last[0])))
                    .toString();
            cargoPlacement.last[0] = Duration(
                    milliseconds: int.parse(cargoPlacement.last[0])
            ).toString();
        }
    }
    
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return Column(
            children: <Widget>[
                CustomLabel(
                    label,
                    style: TextStyle(
                        fontSize: 28.0,
                    ),
                ),
                
                CustomButton(
                    child: CustomLabel(
                        textList[0],
                        style: TextStyle(
                            fontSize: 20.0,
                        ),
                    ),
                    onPressed: () {
                        setState(() => _cargoMenu);
                    },
                ),
            ],
        );
    }
}