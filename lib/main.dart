import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Count.dart';
import 'Select.dart';
import 'god_Count.dart';
import 'tutu1.dart';

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