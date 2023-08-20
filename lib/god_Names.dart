import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';
import 'god_role_show.dart';

class GodName extends StatefulWidget {
  int number;
  GodName({Key? key, required this.number});

  @override
  State<GodName> createState() => _GodNameState();
}
List selected_list = [];

List p9 = [
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  ''
];
List p10 = [
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  ''
];
List p11 = [
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  ''
];
List p12 = [
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  ''
];
Color li_bo_co = gr;

class _GodNameState extends State<GodName> {
  void initState() {
    switch(widget.number){
      case 9:
        selected_list = p9;
        break;
      case 10:
        selected_list = p10;
        break;
      case 11:
        selected_list = p11;
        break;
      case 12:
        selected_list = p12;
        break;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('نام بازیکن ها',style: TextStyle(color: li,fontSize: 25)),
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
            Container(
              height: MediaQuery.of(context).size.height *0.73,
              child: ListView.builder(
                  itemCount: widget.number,
                  itemBuilder: (context, index) {
                    if(index.isEven){
                      li_bo_co = gr;
                    }if(index.isOdd){
                      li_bo_co = re;
                    }
                    int pl_num = index+1;
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20,15,20,0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                            color: bg,
                            border: Border(
                              top: BorderSide(color: li_bo_co,width: 2),
                              left: BorderSide(color: li_bo_co,width: 2),
                              right: BorderSide(color: li_bo_co,width: 2),
                              bottom: BorderSide(color: li_bo_co,width: 2),
                            ),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width*0.4,
                                height: 35,
                                child: TextField(

                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18
                                  ),
                                  decoration: InputDecoration(
                                      focusColor: li,
                                      hoverColor: li,
                                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: li)),
                                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                      hintText: 'نام',
                                      hintStyle: TextStyle(color: Colors.grey[600],fontSize: 20,height: 0.9)
                                  ),
                                  onChanged: (val){
                                    selected_list[index] = val;
                                    print(selected_list);
                                  },
                                  textAlign: TextAlign.right,
                                )
                            ),
                            Text('- $pl_num',style: TextStyle(color: li,fontSize: 21,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(),
            GestureDetector(
              onTap: (){
                setState(() {
                  print(selected_list);
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              GodRoleShow(
                                  plcount :  widget.number,
                                  plname : selected_list
                              )
                      )
                  );
                });},
              child: Container(
                width:  MediaQuery.of(context).size.width *0.78,
                height:  MediaQuery.of(context).size.height *0.083,
                child: Center(child: Text('ادامه',style: TextStyle(color: li,fontSize: 23))),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border(
                    top: BorderSide(color: li,width: 2),
                    bottom: BorderSide(color: li,width: 2),
                    left: BorderSide(color: li,width: 2),
                    right: BorderSide(color: li,width: 2),
                  ),
                  color: bg,

                ),
              ),
            ),
            SizedBox()
          ],
        ),
      ),

    );
  }
}
