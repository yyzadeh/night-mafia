import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'god_game.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import '../../colors.dart';
import 'package:provider/provider.dart';
import '../../TimerClass.dart';

class GodRoleRan extends StatefulWidget {
  List mafias;
  List villagers;
  List players;
  List roles;
  GodRoleRan({Key? key, required this.mafias,required this.villagers,required this.players,required this.roles});
  @override
  State<GodRoleRan> createState() => _GodRoleRanState();
}
Color sel_col = Colors.grey;
String roletitle = '';
List<bool> live = [];

class _GodRoleRanState extends State<GodRoleRan> {
  Future<void> _showMyDial() async {
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
    print(widget.roles);
    super.initState();
    live = List.generate(widget.players.length, (index) => true);
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
                        widget.roles.length,
                            (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                roletitle = widget.roles[index];
                                _showMyDial();
                                if(widget.mafias.contains(widget.roles[index])){
                                  sel_col = re;
                                }else if(widget.roles[index] == 'نوستراداموس'){
                                  sel_col = pu;
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
                                      widget.players[index],
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
                                ChangeNotifierProvider<TimerProvider>(create: (context) => TimerProvider(), child: GodGame(
                                  ma_li: widget.mafias,
                                  vi_li: widget.villagers,
                                  all_pl_name: widget.players,
                                  all_pl_role: widget.roles,
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
