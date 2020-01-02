import 'package:flutter/material.dart';
import 'package:scouting_app/custom.dart';
import 'package:scouting_app/input.dart';
import 'package:scouting_app/name.dart';


void gridMenu(BuildContext context, InputData data, Input input) {
    print('asd');
    showDialog(
      context: context,
      builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Color(0x00000000),
            children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                        width: 400,
                        height: 375,
                        child: GridView.count(
                            crossAxisCount: 8,
                            children: List.generate(56, (index) {
                                if (data.grid[(index / 8).floor()][index % 8] != 000) {
                                    return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: RaisedButton(
                                            onPressed: () {
                                                input.gridButton[data.id].add(
                                                    data.grid[(index / 8).floor()][index % 8].place(),
                                                );
                                                Navigator.pop(context);
                                            },
                                        ),
                                    );
                                } else {
                                    return SizedBox(
                                        width: 1.0,
                                        height: 1.0,
                                    );
                                }
                            }),
                        ),
                    ),
                )
            ]);
      });
}