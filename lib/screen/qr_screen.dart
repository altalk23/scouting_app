import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';

class QRScreen extends StatefulWidget {
    @override
    _QRScreen createState() => _QRScreen();
}

class _QRScreen extends State<QRScreen> {
    String qrData = "";
    int _index;
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: CustomLabel("QR List"),
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => history.removeAt(_index),
                    )
                ],
            ),
            body: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                    return index != 0 ?
                    new CustomButton(
                        child: CustomLabel(
                            "Team " + history[index - 1].split(",")[0],
                            style: TextStyle(
                                fontSize: 28.0,
                            ),
                        ),
                        onPressed: () {
                            setState(() {
                                _index = index - 1;
                                qrData = history[index - 1];
                            });
                        },
                    ) :
                    QrImage(
                        version: 10,
                        data: qrData,
                        size: MediaQuery.of(context).size.width,
                    );
                },
            ),
        );
    }
    
}

