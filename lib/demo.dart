import 'package:scouting_app/loop_list.dart';

void main() {
    /*Stopwatch stopwatch = new Stopwatch();
    stopwatch.start();
    sleep(Duration(seconds: 1));
    print(stopwatch.elapsed);
    var stopwatch2 = stopwatch;
    sleep(Duration(seconds: 1));
    print(stopwatch.elapsed);
    print(stopwatch2.elapsed);*/
    LoopList loopList = new LoopList(["1", "3", "6"]);
    print(loopList[0]);
    print(loopList[1]);
    loopList.loop();
    print(loopList[0]);
    print(loopList[1]);
    loopList.loop(count: 7);
    print(loopList[0]);
    print(loopList[1]);
    print(loopList.length);
}