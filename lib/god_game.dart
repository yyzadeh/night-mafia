import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'TimerClass.dart';
import 'colors.dart';

class GodGame extends StatefulWidget {
  List all_pl_name;
  List all_pl_role;
  List ma_li;
  List vi_li;
  List lives;
  GodGame(
      {Key? key,
        required this.lives,
        required this.all_pl_name,
        required this.all_pl_role,
        required this.ma_li,
        required this.vi_li});
  @override
  State<GodGame> createState() => _GodGameState();
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

class _GodGameState extends State<GodGame> {
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

  var timer;
  @override
  void initState() {
    timer = Provider.of<TimerProvider>(context, listen: false);
    super.initState();
    print(widget.lives);
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
                    if (widget.ma_li.contains(widget.all_pl_role[index]) & widget.lives[index] == true) {
                      cha_col = re;
                    } else if((widget.all_pl_role[index] == 'نوستراداموس') & widget.lives[index] == true){
                      cha_col = pu;
                    } else if (widget.lives[index]== false) {
                      cha_col = Colors.yellow;
                      tt = true;
                    }else {
                    cha_col = gr;
                    print(widget.lives[index]);
                    }
                    if(index+1 == widget.all_pl_name.length){
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, top: 8, right: 10, bottom: 100),
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
                                        child: Text('خارج',style: TextStyle(color: Colors.yellow,fontSize: 20)),
                                        visible: tt,
                                      ),
                                      Visibility(
                                        visible: widget.lives[index],
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {

                                              if(widget.ma_li.contains(widget.all_pl_role[index])){
                                                mafia_killed++;
                                                widget.lives[index] = false;
                                                cha_col = Colors.yellow;

                                              }else if(widget.vi_li.contains(widget.all_pl_role[index])){
                                                villager_killed++;
                                                widget.lives[index] = false;
                                                cha_col = Colors.yellow;

                                              }else if(widget.all_pl_role[index] == 'نوستراداموس'){
                                                widget.lives[index] = false;
                                                cha_col = Colors.yellow;

                                              }
                                              live_mafia = widget.ma_li.length - mafia_killed ;
                                              live_villager = widget.vi_li.length - villager_killed ;

                                            });
                                          },
                                          child: Center(
                                              child:
                                              Image.asset('assets/d.png',height: 100,width: 47,)
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Container(
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  child: Center(
                                    child: Text(widget.all_pl_role[index],
                                        style: TextStyle(
                                            color: cha_col, fontSize: 21)),
                                  )),
                              Container(
                                  width: MediaQuery.of(context).size.width * 0.34,
                                  child: Center(
                                    child: Text(widget.all_pl_name[index],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 21)),
                                  )),
                            ],
                          ),
                        ),
                      );
                    }else{
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, top: 8, right: 10, bottom: 10),
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
                                        child: Text('خارج',style: TextStyle(color: Colors.yellow,fontSize: 20)),
                                        visible: tt,
                                      ),
                                      Visibility(
                                        visible: widget.lives[index],
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {

                                              if(widget.ma_li.contains(widget.all_pl_role[index])){
                                                mafia_killed++;
                                                widget.lives[index] = false;
                                                cha_col = Colors.yellow;

                                              }else if(widget.vi_li.contains(widget.all_pl_role[index])){
                                                villager_killed++;
                                                widget.lives[index] = false;
                                                cha_col = Colors.yellow;

                                              }else if(widget.all_pl_role[index] == 'نوستراداموس'){
                                                widget.lives[index] = false;
                                                cha_col = Colors.yellow;

                                              }
                                              live_mafia = widget.ma_li.length - mafia_killed ;
                                              live_villager = widget.vi_li.length - villager_killed ;

                                            });
                                          },
                                          child: Center(
                                              child:
                                              Image.asset('assets/d.png',height: 100,width: 47,)
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Container(
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  child: Center(
                                    child: Text(widget.all_pl_role[index],
                                        style: TextStyle(
                                            color: cha_col, fontSize: 21)),
                                  )),
                              Container(
                                  width: MediaQuery.of(context).size.width * 0.34,
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
                  boxShadow:[
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 2,
                      blurRadius: 9,
                      offset: Offset(7,7),
                    )],

                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(
                      colors: [
                        da,
                        bg
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                  )
              ),
              width: 178,
              height: 66,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(),
                  Text('${timer.minute} : ${timer.seconds}',style: TextStyle(color: Colors.white70,fontSize: 21),),
                  Visibility(
                    visible: timer.startable,
                    child: GestureDetector(
                      onTap: timer.startTimer,
                      child: Container(
                        width: 33,
                        height: 33,
                        child: Icon(Icons.play_arrow_rounded,color: li,size: 26),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: timer.stopTimer,
                    child: Container(
                      width: 33,
                      height: 33,
                      child: Icon(Icons.stop_rounded,color: li,size: 25),
                    ),
                  ),
                ],
              ));
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(10,0,10,8),
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
                          child: Text('کشته شهر',textAlign: TextAlign.center,style: TextStyle(fontSize: 21,color: Colors.grey[200])),
                        ),
                        Text('$villager_killed',style: TextStyle(color: li,fontSize: 22),)
                      ],
                    ),
                  )
              ),
              Container(
                  height: 98,
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:3),
                          child: Text('کشته مافیا',textAlign: TextAlign.center,style: TextStyle(fontSize: 21,color: Colors.grey[200])),
                        ),
                        Text('$mafia_killed',style: TextStyle(color: li,fontSize: 22),)
                      ],
                    ),
                  )
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          height: 100,
          decoration: BoxDecoration(
              boxShadow:[
                BoxShadow(
                  color: Colors.black54,
                  spreadRadius: 2,
                  blurRadius: 9,
                  offset: Offset(7,7),
                )],

              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                  colors: [
                    da,
                    bg
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
              )
          ),
        ),
      ),
    ));
  }
}
