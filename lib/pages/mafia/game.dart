import 'dart:async';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../TimerClass.dart';
import '../../colors.dart';
import 'package:provider/provider.dart';

class Game extends StatefulWidget {
  List all_pl_name;
  List all_pl_role;
  List ma_li;
  List vi_li;
  List lives;

  Game(
      {Key? key,
      required this.lives,
      required this.all_pl_name,
      required this.all_pl_role,
      required this.ma_li,
      required this.vi_li});

  @override
  State<Game> createState() => _GameState();
}

Color cha_col = li;

List final_cards = [
  'دروغ سیزده',
  'فرش قرمز',
  'مسیر سبز',
  'شلیک نهایی',
  'ذهن زیبا',
  'بی خوابی',
  'روز محاکمه',
  'افشای نقش',
  'روز مافیا',
  'سر شماری',
  'وصیت',
  'روز سکوت',
  'افشای هویت'
];
List shuf_final = final_cards..shuffle();

String vis_fai_role = '';
String data_about = '';

int mafia_killed = 0;
int villager_killed = 0;

int live_mafia = 0;
int live_villager = 0;

class _GameState extends State<Game> {
  var timer;
  Future<bool> showExitPopup() async {
    return await showDialog( //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
        title: Text('خروج',textAlign: TextAlign.right,style: TextStyle(color: Colors.white),),
        content: Text('ایا میخوای خارج شی؟',textAlign: TextAlign.right,style: TextStyle(fontSize: 17,color: Colors.white)),
        backgroundColor: bg,
        actions:[
          ElevatedButton(
            onPressed: () => SystemNavigator.pop(),
            child:Text('بله',style: TextStyle(fontSize: 19),),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child:Text('خیر',style: TextStyle(fontSize: 19),),
          ),
        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }

  Future<void> _showMyData() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: bg,
          title: Center(
              child: Text(
            '$vis_fai_role',
            style:
                TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: li),
          )),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 200,
            child: Center(
              child: Text(
                data_about,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 23),
              ),
            ),
          ),
          alignment: Alignment.center,
          actionsAlignment: MainAxisAlignment.center,
          actionsOverflowAlignment: OverflowBarAlignment.center,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border(
                      top: BorderSide(color: li, width: 2),
                      bottom: BorderSide(color: li, width: 2),
                      left: BorderSide(color: li, width: 2),
                      right: BorderSide(color: li, width: 2),
                    ),
                    color: Color.fromRGBO(1, 1, 1, 0),
                  ),
                  width: 190,
                  height: 60,
                  child: Center(
                    child: Text(
                      'فهمیدم',
                      style: TextStyle(color: li, fontSize: 22),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: bg,
          title: Text(
            'کارت حرکت اخر',
            textAlign: TextAlign.center,
            style:
                TextStyle(color: li, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          content: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 2,
                      blurRadius: 9,
                      offset: Offset(7, 7),
                    )
                  ],
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(
                      colors: [da, bg],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 500,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 10),
                child: ListView(
                  children: [
                    ListTT(0),
                    ListTT(1),
                    ListTT(2),
                    ListTT(3),
                    ListTT(4),
                    ListTT(5),
                    ListTT(6),
                    ListTT(7),
                    ListTT(8),
                    ListTT(9),
                    ListTT(10),
                    ListTT(11),
                    ListTT(12),
                  ],
                ),
              )),
          alignment: Alignment.center,
          actionsAlignment: MainAxisAlignment.center,
          actionsOverflowAlignment: OverflowBarAlignment.center,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 10),
              child: GestureDetector(
                child: Container(
                    width: 160,
                    height: 50,
                    decoration: BoxDecoration(
                      color: bg,
                      borderRadius: BorderRadius.circular(60),
                      border: Border(
                        top: BorderSide(color: re, width: 2),
                        left: BorderSide(color: re, width: 2),
                        right: BorderSide(color: re, width: 2),
                        bottom: BorderSide(color: re, width: 2),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      'در شب کشته شد',
                      style: TextStyle(color: re, fontSize: 19),
                    ))),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _endGame() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: bg,
          title: Center(
              child: Text(
            'مافیا برنده می شود',
            style:
                TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: re),
          )),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 200,
            child: Center(
              child: Text(
                'تعداد مافیا با تعداد شهروندان برابر شد',
                textAlign: TextAlign.center,
                style: TextStyle(color: re, fontSize: 23),
              ),
            ),
          ),
          alignment: Alignment.center,
          actionsAlignment: MainAxisAlignment.center,
          actionsOverflowAlignment: OverflowBarAlignment.center,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, 'sel');
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border(
                      top: BorderSide(color: re, width: 2),
                      bottom: BorderSide(color: re, width: 2),
                      left: BorderSide(color: re, width: 2),
                      right: BorderSide(color: re, width: 2),
                    ),
                    color: Color.fromRGBO(1, 1, 1, 0),
                  ),
                  width: 190,
                  height: 60,
                  child: Center(
                    child: Text(
                      'اتمام بازی',
                      style: TextStyle(color: re, fontSize: 22),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Future<void> _endGameVil() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: bg,
          title: Center(
              child: Text(
            'شهروند برنده می شود',
            style:
                TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: gr),
          )),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 200,
            child: Center(
              child: Text(
                'تمام مافیا ها کشته شدند',
                textAlign: TextAlign.center,
                style: TextStyle(color: gr, fontSize: 23),
              ),
            ),
          ),
          alignment: Alignment.center,
          actionsAlignment: MainAxisAlignment.center,
          actionsOverflowAlignment: OverflowBarAlignment.center,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, 'sel');
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border(
                      top: BorderSide(color: gr, width: 2),
                      bottom: BorderSide(color: gr, width: 2),
                      left: BorderSide(color: gr, width: 2),
                      right: BorderSide(color: gr, width: 2),
                    ),
                    color: Color.fromRGBO(1, 1, 1, 0),
                  ),
                  width: 190,
                  height: 60,
                  child: Center(
                    child: Text(
                      'اتمام بازی',
                      style: TextStyle(color: gr, fontSize: 22),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  void initState() {
    timer = Provider.of<TimerProvider>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    mafia_killed = 0;
    villager_killed = 0;

    live_mafia = 0;
    live_villager = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: showExitPopup,
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: bg, statusBarIconBrightness: Brightness.light),
        toolbarHeight: 0,
        backgroundColor: bg,
      ),
      backgroundColor: bg,
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(content: Text('برای خروج یه بار دیگ بزن')),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SafeArea(
              child: ListView.builder(
                  itemCount: widget.all_pl_name.length,
                  itemBuilder: (context, index) {
                    bool tt = false;
                    if (widget.ma_li.contains(widget.all_pl_role[index]) &
                            widget.lives[index] ==
                        true) {
                      cha_col = re;
                    } else if (widget.lives[index] == false) {
                      cha_col = Colors.yellow;
                      tt = true;
                    } else {
                      cha_col = gr;
                    }
                    if (index + 1 == widget.all_pl_name.length) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 8, right: 10, bottom: 100),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 70,
                          decoration: BoxDecoration(
                            color: bg,
                            borderRadius: BorderRadius.circular(12),
                            border: Border(
                              top: BorderSide(color: cha_col, width: 2),
                              left: BorderSide(color: cha_col, width: 2),
                              right: BorderSide(color: cha_col, width: 2),
                              bottom: BorderSide(color: cha_col, width: 2),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  width: 60,
                                  height: 70,
                                  color: bg,
                                  child: Row(
                                    children: [
                                      Visibility(
                                        child: Text('خارج',
                                            style: TextStyle(
                                                color: Colors.yellow,
                                                fontSize: 20)),
                                        visible: tt,
                                      ),
                                      Visibility(
                                        visible: widget.lives[index],
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (widget.ma_li.contains(
                                                  widget.all_pl_role[index])) {
                                                mafia_killed++;
                                                cha_col = Colors.yellow;
                                                widget.lives[index] = false;
                                              } else if (widget.vi_li.contains(
                                                  widget.all_pl_role[index])) {
                                                villager_killed++;
                                                cha_col = Colors.yellow;
                                                widget.lives[index] = false;
                                              }
                                              live_mafia = widget.ma_li.length -
                                                  mafia_killed;
                                              live_villager =
                                                  widget.vi_li.length -
                                                      villager_killed;

                                              if (live_mafia == live_villager) {
                                                _endGame();
                                              }
                                              if (live_mafia == 0) {
                                                _endGameVil();
                                              }
                                              _showMyDialog();
                                            });
                                          },
                                          child: Center(
                                              child: Image.asset('assets/d.png',height: 100,width: 47,)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: Center(
                                    child: Text(widget.all_pl_role[index],
                                        style: TextStyle(
                                            color: cha_col, fontSize: 21)),
                                  )),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.34,
                                  child: Center(
                                    child: Text(widget.all_pl_name[index],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 21)),
                                  )),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 8, right: 10, bottom: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 70,
                          decoration: BoxDecoration(
                            color: bg,
                            borderRadius: BorderRadius.circular(12),
                            border: Border(
                              top: BorderSide(color: cha_col, width: 2),
                              left: BorderSide(color: cha_col, width: 2),
                              right: BorderSide(color: cha_col, width: 2),
                              bottom: BorderSide(color: cha_col, width: 2),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  width: 60,
                                  height: 70,
                                  color: bg,
                                  child: Row(
                                    children: [
                                      Visibility(
                                        child: Text('خارج',
                                            style: TextStyle(
                                                color: Colors.yellow,
                                                fontSize: 20)),
                                        visible: tt,
                                      ),
                                      Visibility(
                                        visible: widget.lives[index],
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (widget.ma_li.contains(
                                                  widget.all_pl_role[index])) {
                                                mafia_killed++;
                                                cha_col = Colors.yellow;
                                                widget.lives[index] = false;
                                              } else if (widget.vi_li.contains(
                                                  widget.all_pl_role[index])) {
                                                villager_killed++;
                                                cha_col = Colors.yellow;
                                                widget.lives[index] = false;
                                              }
                                              live_mafia = widget.ma_li.length -
                                                  mafia_killed;
                                              live_villager =
                                                  widget.vi_li.length -
                                                      villager_killed;

                                              if (live_mafia == live_villager) {
                                                _endGame();
                                              }
                                              if (live_mafia == 0) {
                                                _endGameVil();
                                              }
                                              _showMyDialog();
                                            });
                                          },
                                          child: Center(
                                              child: Image.asset('assets/d.png',height: 100,width: 47,)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: Center(
                                    child: Text(widget.all_pl_role[index],
                                        style: TextStyle(
                                            color: cha_col, fontSize: 21)),
                                  )),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.34,
                                  child: Center(
                                    child: Text(widget.all_pl_name[index],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 21)),
                                  )),
                            ],
                          ),
                        ),
                      );
                    }
                  })),
        ),
      ),
      floatingActionButton: Consumer<TimerProvider>(
        builder: (context, t, widget) {
          return Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 2,
                      blurRadius: 9,
                      offset: Offset(7, 7),
                    )
                  ],
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(
                      colors: [da, bg],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              width: 178,
              height: 66,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(),
                  Text(
                    '${timer.minute} : ${timer.seconds}',
                    style: TextStyle(color: Colors.white70, fontSize: 21),
                  ),
                  Visibility(
                    visible: timer.startable,
                    child: GestureDetector(
                      onTap: timer.startTimer,
                      child: Container(
                        width: 33,
                        height: 33,
                        child:
                            Icon(Icons.play_arrow_rounded, color: li, size: 26),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: timer.stopTimer,
                    child: Container(
                      width: 33,
                      height: 33,
                      child: Icon(Icons.stop_rounded, color: li, size: 25),
                    ),
                  ),
                ],
              ));
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  height: 98,
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text('کشته شهر',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 21, color: Colors.grey[200])),
                        ),
                        Text(
                          '$villager_killed',
                          style: TextStyle(color: li, fontSize: 22),
                        )
                      ],
                    ),
                  )),
              Container(
                  height: 98,
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text('کشته مافیا',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 21, color: Colors.grey[200])),
                        ),
                        Text(
                          '$mafia_killed',
                          style: TextStyle(color: li, fontSize: 22),
                        )
                      ],
                    ),
                  )),
            ],
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          height: 100,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  spreadRadius: 2,
                  blurRadius: 9,
                  offset: Offset(7, 7),
                )
              ],
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                  colors: [da, bg],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
        ),
      ),
        ));
  }

  Widget ListTT(int index) {
    int nu = index + 1;
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GestureDetector(
        onTap: () {
          setState(() {
            Navigator.of(context).pop();
            vis_fai_role = shuf_final[index];
            _showMyData();
            switch (vis_fai_role) {
              case 'دروغ سیزده':
                data_about =
                    'یک دروغ درباره خودش می گوید و گرداننده بازی تایید می کند';
                break;
              case 'افشای هویت':
                data_about = 'نقش این شخص توسط گرداننده اعلام می شود';
                break;
              case 'روز سکوت':
                data_about = 'یک نفر را انتخاب می کند و این شخص فردا سکوت است';
                break;
              case 'وصیت':
                data_about =
                    'شخص خارج شده از بازی جمله ایی به گرداننده بازی میگوید که به یکی از بازیکنان انتقال دهد';
                break;
              case 'سر شماری':
                data_about =
                    'تعداد مافیا و تعداد شهروند مانده در بازی اعلام می شود';
                break;
              case 'روز جشن مافیا':
                data_about = 'فردا توی روز هیچکس از بازی بیرون نمی رود';
                break;
              case 'افشای نقش':
                data_about =
                    'این شخص یک نفر از بازیکنان را انتخاب می کند و گرداننده نقش آن شخص را برای همه افشا می کند';
                break;
              case 'روز محاکمه':
                data_about =
                    'فردا به محض اینکه روز شود رای گیری می شود و صحبتی انجام نمی شود';
                break;
              case 'بی خوابی':
                data_about = 'شب نمی شود و مستقیم به روز بعد می رویم';
                break;
              case 'ذهن زیبا':
                data_about = 'اگر نقش کسی را دقیق حدس بزند در بازی می ماند';
                break;
              case 'شلیک نهایی':
                data_about = 'در اول شب به جای مافیا این شخص شلیک می کند';
                break;
              case 'مسیر سبز':
                data_about =
                    'فردی که مسیر سبز بگیرد به هیچ عنوان فردا در دفاعیه نمی رود';
                break;
              case 'فرش قرمز':
                data_about =
                    'فردی که فرش قرمز بگیرد فردا مستقیم به دفاعیه می رود';
                break;
            }
          });
        },
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  height: 50,
                  width: 152,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(1, 1, 1, 0),
                    borderRadius: BorderRadius.circular(60),
                    border: Border(
                      top: BorderSide(color: li, width: 2),
                      left: BorderSide(color: li, width: 2),
                      right: BorderSide(color: li, width: 2),
                      bottom: BorderSide(color: li, width: 2),
                    ),
                  ),
                  child: Center(
                    child: Text(shuf_final[index],
                        style: TextStyle(color: li, fontSize: 21)),
                  )),
              Text('$nu', style: TextStyle(color: li, fontSize: 20)),
            ],
          ),
          height: 50,
        ),
      ),
    );
  }
}
