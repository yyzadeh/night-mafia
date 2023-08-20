import 'dart:async';
import 'package:flutter/cupertino.dart';

class TimerProvider with ChangeNotifier{
  Timer? _timer;

  int _hour = 0;
  int _minute = 0;
  int _seconds = 0;
  bool _startable = true;
  bool _stopable = false;
  bool _continueable = false;

  int get hour => _hour;
  int get minute => _minute;
  int get seconds => _seconds;
  bool get continueable => _continueable;
  bool get stopable => _stopable;
  bool get startable => _startable;

  void startTimer(){
    _startable = false;
    _stopable = true;
    _continueable = false;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(_seconds < 59){
        _seconds++;
      }else if(_seconds == 59){
        _seconds = 0;
        if(_minute == 59){
          _hour++;
          _minute == 0;
        }else{
          _minute++;
        }
      }
      notifyListeners();
    });
  }
  void stopTimer(){
    if(_startable == false){
      _hour = 0;
      _minute = 0;
      _seconds = 0;
      _startable = true;
      _stopable = false;
      _continueable = false;
      _timer?.cancel();
    }
    notifyListeners();
}}