import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

class Select extends StatefulWidget {
  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: bg,
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: bg,
            statusBarIconBrightness: Brightness.light
        ),
      ),
      backgroundColor: bg,
      body: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.5,
                    height: 80,
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
                            colors: [
                              da,
                              bg
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                        )
                    ),

                    child: Center(
                      child: Text('سناریو', style: TextStyle(
                          color: Color(0xFFbdbdbd), fontSize: 25)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'num');
                    },
                    child: Container(
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
                              colors: [
                                da,
                                bg
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight
                          )
                      ),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.55,
                      height: MediaQuery
                          .of(context)
                          .size
                          .width * 0.55,
                      child: Center(
                          child: Text('مافیا', style: TextStyle(color: Colors
                              .grey, fontSize: 26))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'godnum');
                    },
                    child: Container(
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
                              colors: [
                                da,
                                bg
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight
                          )
                      ),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.55,
                      height: MediaQuery
                          .of(context)
                          .size
                          .width * 0.55,
                      child: Center(
                          child: Text('پدر خوانده', style: TextStyle(color: Colors
                              .grey, fontSize: 26))),
                    ),
                  ),
                  SizedBox()
                ],
              ),
            ),
          ),
      ),
    );
  }
  }


