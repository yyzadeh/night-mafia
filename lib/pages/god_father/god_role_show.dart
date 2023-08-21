import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'god_role_ran.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import '../../colors.dart';

class GodRoleShow extends StatefulWidget {
  int plcount;
  List plname;

  GodRoleShow({Key? key, required this.plname, required this.plcount});

  @override
  State<GodRoleShow> createState() => _GodRoleShowState();
}

class _GodRoleShowState extends State<GodRoleShow> {
  List villager = [];
  List mafia = [
    'پدر خوانده',
    'سائول گودمن',
    'ماتادور',
  ];
  List nostra = ['نوستراداموس'];
  List all_role = [];

  List vnpl = [
    'دکتر واتسون',
    'لئون حرفه ای',
    'همشهری کین',
    'کنستانتین',
    'شهروند',
  ];
  List vtpl = [
    'دکتر واتسون',
    'لئون حرفه ای',
    'همشهری کین',
    'کنستانتین',
    'شهروند',
    'شهروند',
  ];
  List vepl = [
    'دکتر واتسون',
    'لئون حرفه ای',
    'همشهری کین',
    'کنستانتین',
    'شهروند',
    'شهروند',
    'شهروند',
  ];
  List vtwpl = [
    'دکتر واتسون',
    'لئون حرفه ای',
    'همشهری کین',
    'کنستانتین',
    'شهروند',
    'شهروند',
    'شهروند',
    'شهروند',
  ];

  int selected_vil_number = 0;

  @override
  void initState() {
    switch (widget.plcount) {
      case 9:
        selected_vil_number = 1;
        villager = vnpl;
        break;
      case 10:
        selected_vil_number = 2;
        villager = vtpl;

        break;
      case 11:
        selected_vil_number = 3;
        villager = vepl;

        break;
      case 12:
        selected_vil_number = 4;
        villager = vtwpl;
        break;
    }

    all_role = villager + mafia + nostra;

    all_role = all_role..shuffle();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double hh = MediaQuery.of(context).size.height * 0.06;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('دیدن نقش ها', style: TextStyle(color: li, fontSize: 25)),
        iconTheme: IconThemeData(color: li),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: bg, statusBarIconBrightness: Brightness.light),
        toolbarHeight: 70,
        backgroundColor: bg,
      ),
      backgroundColor: bg,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.3,
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
                child: ResponsiveGridList(
                    horizontalGridMargin: 20,
                    verticalGridMargin: 20,
                    maxItemsPerRow: 2,
                    minItemsPerRow: 2,
                    minItemWidth: 80,
                    children: List.generate(
                      villager.length,
                      (index) => Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(60),
                          border: Border(
                            top: BorderSide(color: gr, width: 2),
                            left: BorderSide(color: gr, width: 2),
                            right: BorderSide(color: gr, width: 2),
                            bottom: BorderSide(color: gr, width: 2),
                          ),
                        ),
                        child: Center(
                            child: Text(villager[index],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold))),
                      ),
                    )),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
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
                height: MediaQuery.of(context).size.height * 0.2,
                child: ResponsiveGridList(
                    horizontalGridMargin: 20,
                    verticalGridMargin: 20,
                    maxItemsPerRow: 2,
                    minItemsPerRow: 2,
                    minItemWidth: 80,
                    children: List.generate(
                      mafia.length,
                          (index) => Container(
                        width: 50,
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
                            child: Text(mafia[index],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold))),
                      ),
                    )),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
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
                height: MediaQuery.of(context).size.height * 0.12,
                child: ResponsiveGridList(
                    horizontalGridMargin: 20,
                    verticalGridMargin: 20,
                    maxItemsPerRow: 2,
                    minItemsPerRow: 2,
                    minItemWidth: 80,
                    children: List.generate(
                      1,
                          (index) => Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(60),
                          border: Border(
                            top: BorderSide(color: pu, width: 2),
                            left: BorderSide(color: pu, width: 2),
                            right: BorderSide(color: pu, width: 2),
                            bottom: BorderSide(color: pu, width: 2),
                          ),
                        ),
                        child: Center(
                            child: Text('نوستراداموس',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold))),
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GodRoleRan(
                              mafias: mafia,
                              villagers: villager,
                              players: widget.plname,
                              roles: all_role,
                            )));
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.78,
                  height: MediaQuery.of(context).size.height * 0.083,
                  child: Center(
                      child: Text('شروع بازی',
                          style: TextStyle(color: li, fontSize: 23))),
                  decoration: BoxDecoration(
                      color: bg,
                      borderRadius: BorderRadius.circular(20),
                      border: Border(
                        top: BorderSide(color: li, width: 2),
                        bottom: BorderSide(color: li, width: 2),
                        left: BorderSide(color: li, width: 2),
                        right: BorderSide(color: li, width: 2),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
