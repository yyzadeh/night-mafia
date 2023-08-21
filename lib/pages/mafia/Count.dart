import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../colors.dart';
import 'Names.dart';

class Count extends StatefulWidget {
  @override
  State<Count> createState() => _CountState();
}
int count = 9;

class _CountState extends State<Count> {

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
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height:  MediaQuery.of(context).size.height *0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap:(){
                          setState(() {
                            if(count < 15){count = count + 1;};
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Center(child: Icon(Icons.keyboard_arrow_up,color: gr,size: 50)),
                          decoration: BoxDecoration(
                            color: bg,
                            borderRadius: BorderRadius.circular(60),
                            border: Border(
                              top: BorderSide(color: gr,width: 2),
                              left: BorderSide(color: gr,width: 2),
                              right: BorderSide(color: gr,width: 2),
                              bottom: BorderSide(color: gr,width: 2),
                            ),
                          ),
                        ),
                      ),

                      Container(
                        width: 40,
                        height: 100,
                        child: Center(child: Text('$count',style: TextStyle(color: li,fontSize: 26))),
                      ),


                      GestureDetector(
                        onTap:(){
                          setState(() {
                            if(count > 8){count = count - 1;};
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Center(child: Icon(Icons.keyboard_arrow_down,color: re,size: 50)),
                          decoration: BoxDecoration(
                            color: bg,
                            borderRadius: BorderRadius.circular(60),
                            border: Border(
                              top: BorderSide(color: re,width: 2),
                              left: BorderSide(color: re,width: 2),
                              right: BorderSide(color: re,width: 2),
                              bottom: BorderSide(color: re,width: 2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                Name(number :  count)
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
        ),
      ),
    );
  }
}

