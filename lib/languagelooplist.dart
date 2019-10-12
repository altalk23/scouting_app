import 'package:flutter/material.dart';
import 'package:scouting_app/loop_list.dart';

Map<String, LoopList> labelList = new Map<String, LoopList>();

Map<String, LoopList> getInput(String local) {
    switch (local) {
        case "en":
            {
                labelList['stopwatch'] = new LoopList(['Start the timer', 'End the timer']);
                labelList['team_number'] = new LoopList(['Team number']);
                labelList['driver_station'] = new LoopList(['Driver alignment']);
                labelList['driver_station_alignment'] = new LoopList(['Left', 'Middle', 'Right']);
                labelList['driver_station_color'] = new LoopList([Colors.red, Colors.blue]);
                labelList['hab_level'] = new LoopList(['Hab start and end level']);
                labelList['hab_start_level'] = new LoopList(['0', '1', '2', '3']);
                labelList['hab_end_level'] = new LoopList(['0', '1', '2', '3']);
                labelList['hab_climb'] = new LoopList(['Hab climb time']);
                labelList['hab_climb_time'] = new LoopList(['Start the counter', 'End the counter', '%counter']);
                labelList['cargo'] = new LoopList(['Cargo placement', 'Set place']);
                labelList['cargo_state'] = new LoopList(['Take cargo', 'Place cargo']);
                labelList['hatch'] = new LoopList(['Hatch placement', 'Set place']);
                labelList['hatch_state'] = new LoopList(['Take hatch', 'Place hatch']);
                labelList['robot'] = new LoopList(['Robot type and count']);
                labelList['robot_type'] = new LoopList(['Teleop', 'Autonomous', 'Mixed']);
                labelList['robot_count'] = new LoopList(['1', '2', '3']);
                labelList['crossing_line'] = new LoopList(['Does it cross the line']);
                labelList['autonomous'] = new LoopList(['Autonomous starts with']);
                labelList['autonomous_starts'] = new LoopList(['Cargo', 'Hatch', 'Mixed']);
                labelList['defense_notes'] = new LoopList(['Defense notes']);
                labelList['notes'] = new LoopList(['Notes']);
                labelList['title'] = new LoopList(['Input Screen']);
            }
            break;
        case "tr":
            {
                labelList['stopwatch'] = new LoopList(['Sayacı başlat', 'Sayacı bitir']);
                labelList['team_number'] = new LoopList(['Takım numarası']);
                labelList['driver_station'] = new LoopList(['Sürücü hizası']);
                labelList['driver_station_alignment'] = new LoopList(['Sol', 'Orta', 'Sağ']);
                labelList['driver_station_color'] = new LoopList([Colors.red, Colors.blue]);
                labelList['hab_level'] = new LoopList(['Hab başlangıç ve bitiş bölümü']);
                labelList['hab_start_level'] = new LoopList(['0', '1', '2', '3']);
                labelList['hab_end_level'] = new LoopList(['0', '1', '2', '3']);
                labelList['hab_climb'] = new LoopList(['Hab tırmanma süresi']);
                labelList['hab_climb_time'] = new LoopList(['Sayacı başlat', 'Sayacı bitir', '%counter']);
                labelList['cargo'] = new LoopList(['Kargo yerleşimi', 'Yeri ayarla']);
                labelList['cargo_state'] = new LoopList(['Kargo al', 'Kargo bırak']);
                labelList['hatch'] = new LoopList(['Kapak yerleşimi', 'Yeri ayarla']);
                labelList['hatch_state'] = new LoopList(['Kapak al', 'Kapak bırak']);
                labelList['robot'] = new LoopList(['Robot türü ve miktarı']);
                labelList['robot_type'] = new LoopList(['Teleop', 'Otonom', 'Karışık']);
                labelList['robot_count'] = new LoopList(['1', '2', '3']);
                labelList['crossing_line'] = new LoopList(['Çizgiyi geçiyor mu']);
                labelList['autonomous'] = new LoopList(['Otonom neyle başlıyor']);
                labelList['autonomous_starts'] = new LoopList(['Kargo', 'Kapak', 'Karışık']);
                labelList['defense_notes'] = new LoopList(['Defans notları']);
                labelList['notes'] = new LoopList(['Notlar']);
                labelList['title'] = new LoopList(['Giriş ekranı']);
            }
            break;
    }
    return labelList;
}
