import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scouting_app/screen/input_screen.dart';

import 'package:scouting_app/widget/custom_button.dart';
import 'package:scouting_app/widget/custom_label.dart';
/*
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth.dart';*/

/// Runs the [MyApp] class.
void main() => runApp(MyApp());

File historyFile;

String fileContent;

List<String> history = new List<String>();

/// Initializes the map of [String] keys and [Object] objects.
Map mainMap = new Map<String, Object>();

/// Builds the main state, which contains [MyHomePage] state.
class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
            ),
            home: InputScreen(),
            //home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
    }
}

/// Creates the class [ItemData].
///
/// Contains the parameters [text] and [mapKey].
class ItemData {
    ItemData({this.text, this.mapKey});
    
    final String text;
    final String mapKey;
    
}


class MyHomePage extends StatefulWidget {
    MyHomePage({Key key, this.title}) : super(key: key);
    
    final String title;
    
    @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    
    Stopwatch stopwatch;
    //All (?) variable initializations
    Color currentColor = Colors.red;
    List<String> alignmentList = ['Left', 'Mid', 'Right'];
    String driverAlignment = 'Left';
    bool crossesLine = false;
    List<String> autonomousList = ['Hatch', 'Cargo', 'Nothing'];
    String autonomousMode = 'Hatch';
    List<Widget> widgetList;
    bool stopwatchVisible = true;
    List<String> workList = ['Teleop', 'Autonomous', 'Mixed'];
    String workMode = 'Teleop';
    Stopwatch habStopwatch = new Stopwatch();
    String climbTime = 'Start the counter';
    List<List<String>> hatchPlacement = new List<List<String>>();
    List<String> hatchList = ['Take Hatch', 'Place Hatch'];
    String hatchText = 'Take Hatch';
    
    
    
    _MyHomePageState() {
        mainMap['team_number'] = '';
        mainMap['driver_color'] = currentColor.value.toString();
        mainMap['driver_alignment'] = driverAlignment;
        mainMap['crosses_line'] = crossesLine;
        mainMap['autonomous_mode'] = autonomousMode;
        mainMap['cargo_placement_start'] = '';
        mainMap['cargo_placement_duration'] = '';
        mainMap['cargo_placement_place'] = '';
        mainMap['hatch_placement_start'] = '';
        mainMap['hatch_placement_duration'] = '';
        mainMap['hatch_placement_place'] = '';
        mainMap['work_mode'] = workMode;
        mainMap['start_level'] = 0;
        mainMap['end_level'] = 0;
        mainMap['climb_time'] = new Duration().toString();
        mainMap['robot_count'] = 0;
        mainMap['defense_robot'] = '';
        mainMap['notes'] = '';
        
        hatchPlacement.add(new List<String>());
        
        // Copied from stackoverflow, it doesn't work though
        /*
        final _key = {
            "type": "service_account",
            "project_id": //etc
            // ...
            // ...
        };

        print('getting oauth');
        var auth;
        auth.obtainAccessCredentialsViaServiceAccount(
                auth.ServiceAccountCredentials.fromJson(_key),
                scopes,
                http.Client())
                .then((auth.AccessCredentials cred) {
            print('got oauth');
    
            auth.AuthClient client = auth.authenticatedClient(http.Client(), cred);
            SheetsApi api = new SheetsApi(client);
            ValueRange vr = new ValueRange.fromJson({
                "values": [
                    [ // fields A - J
                        "15/02/2019", "via API 3", "5", "3", "3", "3", "3", "3", "3", "3"
                    ]
                ]
            });
            print('about to append');
            api.spreadsheets.values
                    .append(vr, '1cl...spreadsheet_key...W5E', 'A:J',
                    valueInputOption: 'USER_ENTERED')
                    .then((AppendValuesResponse r) {
                print('append completed.');
                client.close();
            });
            print('called append()');
        });
        print('ended?');
        */
    }
    
    // Start of struggle
    
    Future get _localPath async {
        final applicationDirectory = await getApplicationDocumentsDirectory();
        return applicationDirectory.path;
    }
    
    Future get _localFile async {
        final path = await _localPath;
        return File("$path/history.txt");
    }
    
    Future _readFile() async {
        try {
            final file = await _localFile;
            print(file);
            fileContent = await file.readAsString();
            history = fileContent.split("\t");
            print(history);
        }
        catch (e) {
            print(e);
            return null;
        }
    }
    
    Future _writeFile(String text) async {
        final file = await _localFile;
        await file.writeAsString("$text");
    }
    
    // End of struggle
    
    @override
    void initState() {
        super.initState();
        _readFile();
    }
    
    String mapToString(Map<String, Object> map) {
        List<Object> list = new List<Object>();
        map.forEach((String key, Object value) => list.add(value));
        return list.join(",");
    }
    
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: CustomLabel(widget.title),
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.code),
                        onPressed: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                            builder: (context) => QRScreen()
                                    )
                            );
                        },
                    ),
                    IconButton(
                        icon: Icon(Icons.save),
                        onPressed: () {
                            _writeFile(history.join("\t"));
                        },
                    ),
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                            history.add(mapToString(mainMap));
                        },
                    ),
                ],
            ),
            body: ListView.separated(
                padding: EdgeInsets.all(16.0),
                itemBuilder: (context, position) {
                
                },
                //itemCount: 27,
                // TODO: Change this all the time because making it variable
                itemCount: 26,
                separatorBuilder: (context, position) => SizedBox(height: 20.0),
            ),
        );
    }
}

