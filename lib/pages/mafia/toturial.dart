import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'RoleShow.dart';
import '../../colors.dart';

class Tu extends StatefulWidget {
  int sv;
  int sm;
  List pm;
  Tu({Key? key,required this.sv, required this.pm, required this.sm});
  @override
  State<Tu> createState() => _TuState();
}

class _TuState extends State<Tu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('راهنما',style: TextStyle(color: li,fontSize: 26)),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(),
            Text('تغییر نقش ها',style: TextStyle(color: gr,fontSize: 24)),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Text('برای تغیر نقش, به روی نقش بزن تا صفحه انتخاب برات باز بشه و بعد نقشی ک دوست داشتی رو جایگزین کن',textAlign: TextAlign.center,style: TextStyle(color: Color(0xFFbdbdbd),fontSize: 20),),
              ),
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
            SizedBox(),

            Text('اطلاعات راجب نقش',style: TextStyle(color: re,fontSize: 24)),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Text('به روی نقشی ک میخوای چند ثانیه انگشتتو نگه دار تا صفحه برات باز شه و کاربرد نقش رو بهت بگه',textAlign: TextAlign.center,style: TextStyle(color: Color(0xFFbdbdbd),fontSize: 20)),
              ),
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
            SizedBox(),

            GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          RoleSh(
                              vico : widget.sv,
                              maco : widget.sm,
                              plnam : widget.pm
                          )
                  ),
              );},
              child: Container(
                width: MediaQuery.of(context).size.width*0.78,
                height: MediaQuery.of(context).size.height*0.083,
                child: Center(child: Text('فهمیدم',style: TextStyle(color: li,fontSize: 23))),
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
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
