import 'package:flutter/material.dart';
import 'package:scouting_app/loop_list.dart';
import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';

import '../constant.dart';

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
    Cargo({this.label, this.textList, this.stopwatch, this.map, this.dialogLabel});
    
    final String label;
    final String dialogLabel;
    final LoopList textList;
    final Stopwatch stopwatch;
    final Map map;
    
    @override
    State createState() {
        return new _Cargo(this.label, this.textList, this.stopwatch, this.map, this.dialogLabel);
    }
}

class _Cargo extends State<Cargo> {
    final String label;
    final String dialogLabel;
    final LoopList textList;
    final Stopwatch stopwatch;
    final Map map;
    
    _Cargo(this.label, this.textList, this.stopwatch, this.map, this.dialogLabel);
    
    
    List<String> cargoData = new List<String>();
    
    
    Widget _buttonPressed(index) {
        return CustomButton(
            child: CustomLabel(placementName[index]),
            onPressed: () {
                cargoData.add(placement[index]);
                map['cargo_placement_start'] += '\n' + cargoData[0];
                map['cargo_placement_duration'] += '\n' + cargoData[1];
                map['cargo_placement_place'] += '\n' + cargoData[2];
                cargoData = new List<String>();
                print(map.toString());
                Navigator.pop(context);
            },
        );
    }
    
    void _cargoMenu() {
        print("asdas");
        textList.loop();
        cargoData.add(stopwatch.elapsed.inMilliseconds.toString());
        print(cargoData);
        if (textList.start == 0) {
            cargoData[1] = DateTime.fromMillisecondsSinceEpoch(
                    int.parse(cargoData[1]))
                    .difference(DateTime.fromMillisecondsSinceEpoch(
                    int.parse(cargoData[0])))
                    .toString();
            cargoData[0] = Duration(
                    milliseconds: int.parse(cargoData[0])
            ).toString();
            print(cargoData);
            
            showDialog(
                    context: context,
                    builder: (BuildContext context) {
                        return SimpleDialog(
                                title: new CustomLabel(dialogLabel),
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
        }
    }
    
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return Column(
            children: <Widget>[
                CustomLabel(
                    label,
                    fontSize: Constant.mediumFont,
                ),
                
                CustomButton(
                    child: CustomLabel(
                        textList[0],
                        fontSize: Constant.smallFont,
                    ),
                    onPressed: () {
                        setState(() {
                            _cargoMenu();
                        });
                    },
                ),
            ],
        );
    }
}