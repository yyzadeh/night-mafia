import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../colors.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import '../../TimerClass.dart';
import 'game.dart';

class RolRan extends StatefulWidget {
  List mafia_list;
  List villager_list;
  List player_names;
  int nume;
  List all;

  RolRan(
      {Key? key,
      required this.player_names,
      required this.villager_list,
      required this.nume,
      required this.all,
      required this.mafia_list});

  @override
  State<RolRan> createState() => _RolRanState();
}

List allend = [];
List<bool> live = [];

Color sel_col = Colors.grey;
String roletitle = '';

class _RolRanState extends State<RolRan> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: bg,
          title: Text(roletitle,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 25),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(''),
              ],
            ),
          ),
          alignment: Alignment.center,
          actionsAlignment: MainAxisAlignment.center,
          actionsOverflowAlignment: OverflowBarAlignment.center,
          icon: Icon(
            Icons.person_2_rounded,
            color: sel_col,
            size: 35,
          ),
          actions: <Widget>[
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                    width: 43,
                    height: 43,
                    decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(20),
                        border: Border(
                          top: BorderSide(color: sel_col,width: 2),
                          bottom: BorderSide(color: sel_col,width: 2),
                          left: BorderSide(color: sel_col,width: 2),
                          right: BorderSide(color: sel_col,width: 2),
                        )
                    ),
                    child: Center(
                      child: Icon(Icons.close_rounded,color: Colors.white,size: 24,),
                    )
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    allend = widget.all..shuffle();
    print(widget.all);
    super.initState();
    live = List.generate(widget.player_names.length, (index) => true);
  }

  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var hi = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text('بزن رو اسمت',style: TextStyle(color: li,fontSize: 25)),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: wi,
              height: hi * 0.7,
              child: ResponsiveGridList(
                horizontalGridMargin: 25,
                verticalGridMargin: 35,
                minItemWidth: 150,
                maxItemsPerRow: 2,
                minItemsPerRow: 2,
                children: List.generate(
                    widget.villager_list.length + widget.mafia_list.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                            onTap: () {
                              setState(() {
                                 roletitle = allend[index];
                                _showMyDialog();
                                if(widget.mafia_list.contains(allend[index])){
                                  sel_col = re;
                                }else{
                                  sel_col = gr;
                                }
                              });
                            },
                            child: Container(
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

                                child: Center(
                                    child: Text(
                                  widget.player_names[index],
                                  style: TextStyle(fontSize: 21,color: Colors.white),
                                ))),
                          ),
                    )),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            ChangeNotifierProvider<TimerProvider>(create: (context) => TimerProvider(), child: Game(
                              ma_li: widget.mafia_list,
                              vi_li: widget.villager_list,
                              all_pl_name: widget.player_names,
                              all_pl_role: allend,
                              lives: live,
                            )
                    )
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width*0.78,
                height: MediaQuery.of(context).size.height*0.083,
                child: Center(child: Text('لیست مدیریت',style: TextStyle(color: li,fontSize: 23))),
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
        )));
  }
}
