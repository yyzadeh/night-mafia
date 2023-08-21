import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Pages/mafia/Count.dart';
import 'Pages/Select.dart';
import 'Pages/god_father/god_Count.dart';
import 'Pages/loading.dart';

void main() {
  runApp(MaterialApp(
    home:TuTo(),
    debugShowCheckedModeBanner: false,
    routes: {
      'num': (context) => Count(),
      'godnum': (context) => GodCount(),
      'sel': (context) => Select()
    },

  ));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF212121),
    systemNavigationBarIconBrightness: Brightness.light
  ));
}