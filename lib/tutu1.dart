import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'colors.dart';

import 'Select.dart';

class TuTo extends StatefulWidget {
  @override
  State<TuTo> createState() => _TuToState();
}

class _TuToState extends State<TuTo> {



  @override
  void initState() {
    Timer timer = Timer(Duration(milliseconds: 3500), () {
      Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => Select()
          )
      );
    });

    super.initState();
    setState(() {
      timer;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Lottie.asset('assets/ma.json'),
        ),
      ),
    );
  }
}
