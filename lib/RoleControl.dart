import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';
import 'toturial.dart';
class RoleCon extends StatefulWidget {
  int plcount;
  List plname;
  RoleCon({Key? key,required this.plname, required this.plcount});

  @override
  State<RoleCon> createState() => _RoleConState();
}
int selected_maco = 0;
int selected_vilco = 0;

int ma_co8 = 2;
int vil_co8 = 6;

int ma_co9 = 3;
int vil_co9 = 6;

int ma_co10 = 3;
int vil_co10 = 7;

int ma_co11 = 4;
int vil_co11 = 7;

int ma_co12 = 4;
int vil_co12 = 8;

int ma_co13 = 4;
int vil_co13 = 9;

int ma_co14 = 4;
int vil_co14 = 10;

int ma_co15 = 5;
int vil_co15 = 10;

class _RoleConState extends State<RoleCon> {
  
@override
  void initState() {
  switch(widget.plcount){
    case 8:
      selected_maco = ma_co8;
      selected_vilco = vil_co8;
      break;
    case 9:
      selected_maco = ma_co9;
      selected_vilco = vil_co9;
      break;
    case 10:
      selected_maco = ma_co10;
      selected_vilco = vil_co10;
      break;
    case 11:
      selected_maco = ma_co11;
      selected_vilco = vil_co11;
      break;
    case 12:
      selected_maco = ma_co12;
      selected_vilco = vil_co12;
      break;
    case 13:
      selected_maco = ma_co13;
      selected_vilco = vil_co13;
      break;
    case 14:
      selected_maco = ma_co14;
      selected_vilco = vil_co14;
      break;
    case 15:
      selected_maco = ma_co15;
      selected_vilco = vil_co15;
      break;
  }

  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('تعداد افراد',style: TextStyle(color: li,fontSize: 25)),
        iconTheme: IconThemeData(
            color: li
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: bg,
            statusBarIconBrightness: Brightness.light
        ),
        toolbarHeight: 70,
        backgroundColor: bg,
      ),
      backgroundColor: bg,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(),
            Container(
              width: 180,
              height: 60,
                decoration: BoxDecoration(
                    boxShadow:[
                      BoxShadow(
                        color: Colors.black54,
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(5,5),
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
                child: Center(child: Text('تعداد مافیا',style: TextStyle(color: Colors.grey,fontSize: 20),))
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.6,
              height: MediaQuery.of(context).size.height*0.1,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          if(selected_maco < 5){
                            if(selected_vilco - selected_maco > 2){
                              selected_maco = selected_maco + 1;
                              selected_vilco = selected_vilco - 1;
                            }
                          }
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.2,
                        height: MediaQuery.of(context).size.height*0.1,

                        child: Center(
                          child: Icon(Icons.keyboard_arrow_up_outlined,color: gr,size: 35),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.2,
                      height: MediaQuery.of(context).size.height*0.1,

                      child: Center(
                        child: Text('$selected_maco',style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          if(selected_maco > 2){
                            selected_maco = selected_maco - 1;
                          selected_vilco = selected_vilco + 1;
                          }
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.2,
                        height: MediaQuery.of(context).size.height*0.1,

                        child: Center(
                          child: Icon(Icons.keyboard_arrow_down_outlined,color: re,size: 35),
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ),
            SizedBox(),
            Container(
                width: 180,
                height: 60,
                decoration: BoxDecoration(
                    boxShadow:[
                      BoxShadow(
                        color: Colors.black54,
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(5,5),
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
                child: Center(child: Text('تعداد شهروندان',style: TextStyle(color: Colors.grey,fontSize: 20),))
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.6,
              height: MediaQuery.of(context).size.height*0.1,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          if(selected_maco > 2){
                            selected_maco = selected_maco - 1;
                            selected_vilco = selected_vilco + 1;
                          }
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.2,
                        height: MediaQuery.of(context).size.height*0.1,

                        child: Center(
                          child: Icon(Icons.keyboard_arrow_up_outlined,color: gr,size: 35),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.2,
                      height: MediaQuery.of(context).size.height*0.1,

                      child: Center(
                        child: Text('$selected_vilco',style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          if(selected_maco < 5){
                            if(selected_vilco - selected_maco > 2){
                              selected_maco = selected_maco + 1;
                              selected_vilco = selected_vilco - 1;
                            }
                          }
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.2,
                        height: MediaQuery.of(context).size.height*0.1,

                        child: Center(
                          child: Icon(Icons.keyboard_arrow_down_outlined,color: re,size: 35),
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ),
            SizedBox(),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            Tu(
                              pm: widget.plname,
                              sm: selected_maco,
                              sv: selected_vilco,
                            )
                    )
                );},

              child: Container(
                width: MediaQuery.of(context).size.width*0.78,
                height: MediaQuery.of(context).size.height*0.083,
                child: Center(child: Text('ادامه',style: TextStyle(color: li,fontSize: 23))),
                decoration: BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(20),
                    border: Border(
                      top: BorderSide(color: li,width: 2),
                      bottom: BorderSide(color: li,width: 2),
                      left: BorderSide(color: li,width: 2),
                      right: BorderSide(color: li,width: 2),
                    )
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
