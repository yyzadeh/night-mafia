import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'role_random.dart';
class RoleSh extends StatefulWidget {
  int maco;
  int vico;
  List plnam;

  RoleSh(
      {Key? key, required this.plnam, required this.maco, required this.vico});

  @override
  State<RoleSh> createState() => _RoleShState();
}

List selected_ma = [];

List m2 = ['گاد فادر', 'مافیا ساده'];
List m3 = ['گاد فادر', 'دکتر لکتر', 'مافیا ساده'];
List m4 = ['گاد فادر', 'دکتر لکتر', 'جوکر', 'مافیا ساده'];
List m5 = ['گاد فادر', 'دکتر لکتر', 'معشوقه', 'جوکر', 'مافیا ساده'];

List selected_vi = [];

List v5 = [
  'دکتر',
  'کاراگاه',
  'اسنایپر',
  'جان سخت',
  'شهروند',
];
List v6 = [
  'دکتر',
  'کاراگاه',
  'اسنایپر',
  'جان سخت',
  'شهروند',
  'شهروند',
];
List v7 = [
  'دکتر',
  'کاراگاه',
  'اسنایپر',
  'جان سخت',
  'تفنگدار',
  'شهروند',
  'شهروند',
];
List v8 = [
  'دکتر',
  'کاراگاه',
  'اسنایپر',
  'جان سخت',
  'تفنگدار',
  'شهروند',
  'شهروند',
  'شهروند',
];
List v9 = [
  'دکتر',
  'کاراگاه',
  'اسنایپر',
  'جان سخت',
  'تفنگدار',
  'قاضی',
  'شهروند',
  'شهروند',
  'شهروند',
];
List v10 = [
  'دکتر',
  'کاراگاه',
  'اسنایپر',
  'جان سخت',
  'تفنگدار',
  'روانپزشک',
  'قاضی',
  'شهروند',
  'شهروند',
  'شهروند',
];
List v11 = [
  'دکتر',
  'کاراگاه',
  'اسنایپر',
  'جان سخت',
  'تفنگدار',
  'قاضی',
  'روانپزشک',
  'شهروند',
  'شهروند',
  'شهروند',
  'شهروند',
];
List v12 = [
  'دکتر',
  'کاراگاه',
  'اسنایپر',
  'جان سخت',
  'تفنگدار',
  'قاضی',
  'روانپزشک',
  'شهروند',
  'شهروند',
  'شهروند',
  'شهروند',
  'شهروند',
];
List v13 = [
  'دکتر',
  'کاراگاه',
  'اسنایپر',
  'جان سخت',
  'تفنگدار',
  'قاضی',
  'روانپزشک',
  'شهروند',
  'شهروند',
  'شهروند',
  'شهروند',
  'شهروند',
  'شهروند',
];






List all_ma = [
  'گاد فادر',
  'مافیا ساده',
  'دکتر لکتر',
  'معشوقه',
  'جوکر',
  'ناتاشا',
  'بازجو',
  'تروریست',
  'مذاکره کننده',
  'ناتو',
  'یاکوزا',
  'افسونگر',
  'مرد قوی',
  'گروگان گیر',
];

List all_vil = [
  'شهروند',
  'دکتر',
  'کاراگاه',
  'اسنایپر',
  'جان سخت',
  'تفنگدار',
  'قاضی',
  'روانپزشک',
  'قهرمان',
  'کشیش',
  'هکر',
  'محافظ',
  'فدایی',
  'جادوگر',
  'فرشته',
  'نانوا',
  'ساقی',
  'فرمانده',
  'نگهبان',
  'تکاور',
  'زندانبان',
  'وکیل',
  'بمبر',
  'گورکن',
  'سم ساز'
];

int sel_role = 0;

bool vi = false;

List all_sel = [];

String change_name = '';

String cm = 'نقشی ک میخوای رو انتخاب کن';
String cv = 'نقشی ک میخوای رو انتخاب کن';

String role_title = '';
String mm = '';

String role_about = '';

Color sel_col = Colors.white;

Color ss = Colors.white;

class _RoleShState extends State<RoleSh> {

  Future<void> _roleDoc() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: bg,
          title: Text(role_title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(role_about,textAlign: TextAlign.justify,style: TextStyle(color: Colors.white,fontSize: 20),),
              ],
            ),
          ),
          alignment: Alignment.center,
          actionsAlignment: MainAxisAlignment.center,
          actionsOverflowAlignment: OverflowBarAlignment.center,
          icon: Image.asset('assets/${mm}.png',width: 50,height: 50,),
          actions: <Widget>[
            GestureDetector(
              child:  Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(1, 1, 1, 0),
                    border: Border(
                      top: BorderSide(color: ss,width: 2),
                      left: BorderSide(color: ss,width: 2),
                      right: BorderSide(color: ss,width: 2),
                      bottom: BorderSide(color: ss,width: 2),
                    ),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24,
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
    switch (widget.maco) {
      case 2:
        selected_ma = m2;
        break;
      case 3:
        selected_ma = m3;
        break;
      case 4:
        selected_ma = m4;
        break;
      case 5:
        selected_ma = m5;
        break;
    }
    switch (widget.vico) {
      case 5:
        selected_vi = v5;
        break;
      case 6:
        selected_vi = v6;
        break;
      case 7:
        selected_vi = v7;
        break;
      case 8:
        selected_vi = v8;
        break;
      case 9:
        selected_vi = v9;
        break;
      case 10:
        selected_vi = v10;
        break;
      case 11:
        selected_vi = v11;
        break;
      case 12:
        selected_vi = v12;
        break;
      case 13:
        selected_vi = v13;
        break;
    }
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('انتخاب نقش ها',style: TextStyle(color: li,fontSize: 25)),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(),
            Container(
                width: MediaQuery.of(context).size.width*0.85,
                height: MediaQuery.of(context).size.height * 0.32,
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
                  child: ResponsiveGridList(
                      horizontalGridMargin: 20,
                      verticalGridMargin: 20,
                      maxItemsPerRow: 2,
                      minItemsPerRow: 2,
                      minItemWidth: 80,
                      children: List.generate(
                          widget.maco,
                          (index) =>
                          GestureDetector(
                                onTap: () {
                                  setState(() {
                                    vi = true;
                                    change_name = cm;
                                    sel_role = index;
                                    all_sel = all_ma;
                                    sel_col = re;
                                  });
                                },
                            onLongPress: () {
                              setState(() {
                                switch (selected_ma[index]){
                                  case 'گاد فادر':
                                    role_about = 'گادفادر، دون یا پدرخوانده همان رئیس گروه مافیا است. تصمیم نهایی را می‌گیرد و توسط گاد هم به کارآگاه لو داده نمی‌شود';
                                    break;
                                  case 'مافیا ساده':
                                    role_about = 'مثل همه حق صحبت دارد، رای می‌دهد و شب‌ها در تصمیم‌گیری‌ها شرکت می‌کند. وظایف او به همین‌ها ختم می‌شود';
                                    break;
                                  case 'دکتر لکتر':
                                    role_about = ' دکتر لکتر یا جراح مافیا به این صورت است که هر شب یکی از مافیا ها را انتخاب و از خطر تیرخوردن در شب نجات می دهد. او فقط یکبار می تواند خودش را نجات دهد.همچنین هرشب فقط یکی را می تواند از خطر شلیک نجات دهد';
                                    break;
                                  case 'معشوقه':
                                    role_about = 'مافیایی ک اگر در روز از بازی خارج شود، ان شب مافیا دو شلیک دارد';
                                    break;
                                  case 'جوکر':
                                    role_about = 'در بازی ک کاراگاه وجود داشته باشد، وقتی جوکر شخصی را در شب انتخاب،استعلام ان شخص برای کاراگاه معکوس میشود';
                                    break;
                                  case 'ناتاشا':
                                    role_about = 'ناتاشا یا سایلنسر می‌تواند هر شب یک نفر را برای روز بعد سایلنت کند. حتی اگر آن یک نفر از اعضای گروهش باشد یا خودش باشد.نقش مقابل ناتاشا در واقع کشیش است.اگر ناتاشا مورد انتخاب ساقی قرار بگیرد خودش سایلنت می شود و حق رای هم ندارد';
                                    break;
                                  case 'بازجو':
                                    role_about = 'یک مافیا که می‌تواند از طریق گاد، یک یا چند نفر را به صورت محدود بازجویی کند.گاد، زمانی که حکم بازجویی یک شخص را از بازجو بگیرد، نقش و کاری را که آن شب انجام داده به بازجو اعلام می‌کند. مثلا میگوید فلانی گان است و امشب یک تیر به چه کسی داده است';
                                    break;
                                  case 'تروریست':
                                    role_about = 'زمانی که تروریست در روز توسط بازیکنان از بازی خارج می شود می تواند با گفتن کلمه تروریست یک نفر را ترور و از بازی مافیا همراه خودش خارج کند.تروریست هم اگر شب توسط ساقی انتخاب شده باشد در روز نمی تواند کسی را از بازی خارج کند';
                                    break;
                                  case 'مذاکره کننده':
                                    role_about = 'مذاکره کننده یکی از اعضای بازی مافیا است که در طول بازی می‌تواند یک نفر را انتخاب کند و او را عضوی از دسته‌ی مافیا کند.نکته اینجاست که کسی که انتخاب شده اگر نقش اصلی در شهروندی داشته باشد معامله صورت کرفته موفقیت آمیز نیست';
                                    break;
                                  case 'ناتو':
                                    role_about = 'ناتو در بازی مافیا به دنبال نقش شهروندان است. بدین صورت که در شب گاد اعلام میکند مثلا علی دکتر است؟ و به این صورت گاد او را تایید یا رد می کند';
                                    break;
                                  case 'یاکوزا':
                                    role_about = 'یاکوزا نقشش یه این صورت است که در روز اول بازی انجام می شود حتی رای گیری می شود و می توان یک نفر را از بازی خارج کرد. اما در پایان روز زمانی که شب می شود، قبل از معارفه یاکوزا از خواب بیدار شده و تمام شخصیت ها توسط گاد به او معرفی می شوند.یاکوزا می تواند آن شب جای یک شهروند را به دلخوا با یک مافیا تعویض کند.اما نکته اینجاست اگر گاد شهروند را خواب بیدار کند و به او بگوید که او میتوان مافیا شود ایا آن را میپذیرد یا نه و شهروند نپذیرد، یاکوزا میمیرد.اما اگر بپذیرد جای این دو نفر با هم تعویض شده ولی یاکوزا حق معرفی ان را به هم تیمی هایش ندارد و مافیا نیز حق اینکه اعلام کند شهروند شده را ندارد';
                                    break;
                                  case 'افسونگر':
                                    role_about = 'هرشب قبل از بیدار شدن مافیا از خواب بیدار شده و یک نفر را به اختیار خود انتخاب  میکند و آن شخص قابلیت خود را درشب از دست میدهد. افسونگر باید توجه داشته باشد از دسته مافیا نباشد تا به پیروزی تیم خود کمک کند';
                                    break;
                                  case 'مرد قوی':
                                    role_about = 'به این صورت است که یک تفنگ در دست دارد و در فاز شب می تواند تنها با یک گلوله ای که در تفنگ است، بازیکن را مورد هدف قرار داده و آن را بکشد.نکته اینجاست که اگر مرد قوی شخصی در شب شات کند رییس مافیا دیگر حق شات کردن در آن شب را ندارد';
                                    break;
                                  case 'گروگان گیر':
                                    role_about = 'نقش گروگانگیر در بازی مافیا به اسن صورت است که او هر شب یکی از شهروندها را گروگان میگیرد و دو شب پشت سرهم نمی تواند یک نفر را گروگان بگیرد.نکته قابل توجه اینجاست که اولا گروگانگیر در بازی  اگر شخصیت های نقش اصلی را گروگان بگیرد ان شخصیت ها نمیتواند نقش خود را تا زمانی که گروگان هستند ایفا کنند.دوما اگر که گروگانگیر نگهبان را گروگان بگیرد خودش نمی تواند که نقشش را ایفا کند و در شب گاد به او علامت استاپ را نشان میدهد که یعنی توسط نگهبان محافظت میشود و نمیتواند که کسی را گروگان بگیرد';
                                    break;
                                  case 'سم ساز':
                                    role_about = 'می‌تواند به تعداد محدودی که تعیین شده سم بسازد و به کسی تزریق کند. شخصی که سم دریافت کرده بعد از سه روز می‌میرد';
                                    break;
                                }
                                ss = re;
                                mm = '1';
                                role_title = selected_ma[index];
                                _roleDoc();
                              });
                            },

                            child: Container(
                                  width: 50,
                                  height: 50,
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
                                  child: Center(
                                      child: Text(selected_ma[index],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold))),
                                ),
                              ))),
                )),
            Container(
                width: MediaQuery.of(context).size.width*0.85,
                height: MediaQuery.of(context).size.height * 0.35,
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
                  child: ResponsiveGridList(
                      horizontalGridMargin: 20,
                      verticalGridMargin: 20,
                      minItemsPerRow: 2,
                      maxItemsPerRow: 2,
                      minItemWidth: 100,
                      children: List.generate(
                          widget.vico,
                          (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    vi = true;
                                    sel_col = gr;
                                    change_name = cv;
                                    sel_role = index;
                                    all_sel = all_vil;
                                  });
                                },
                                onLongPress: () {
                                  ss = gr;
                                  setState(() {
                                    switch (selected_vi[index]){
                                      case 'شهروند':
                                        role_about = 'شهروند ساده یا همان شهروند وظیفه خاصی ندارد. صبح‌ها می‌تواند در تصمیم‌گیری‌ها شرکت کند صحبت کند و رای بدهد. بعد از رای‌گیری زمانی که شب فرامی‌رسد کار او هم تمام می‌شود و وظیفه‌ای ندارد که انجام دهد';
                                        break;
                                      case 'دکتر':
                                        role_about = 'دکتر وظیفه‌ای در قبال شهروندها دارد. وقتی که مافیا شخصی را ترور می‌کند، اگر دکتر به درستی تشخیص بدهد که آن یک نفر کیست می‌‌تواند جانش را نجات بدهد.به عبارتی او را شفا یا هیل بدهد. دکتر هم ممکن است ترور شود و می‌تواند خودش را هم درمان کند. تعداد دفعات درمان کردن دکتر، برابر است با تعداد دفعات ترور مافیا';
                                        break;
                                      case 'کاراگاه':
                                        role_about = 'یکی از شهروندها است و در طول بازی می‌ تواند از گاد درباره این که یک شخص مافیا است یا شهروند سوال کند و گاد اطلاعات لازم را به او میدهد.این ویژگی او باعث می شود که مافیا همیشه به دنبال او باشند پس باید مراقب باشد که شخصیتش لو نرود';
                                        break;
                                      case 'اسنایپر':
                                        role_about = 'اسنایپر شهروندی است که تفنگ دارد و می‌تواند به کسانی که فکر می‌کند مافیا هستند شلیک کند.تعداد تیرهای اسنایپر محدود است و باید قبل از بازی مشخص شود. اسنایپر نمی‌تواند خودکشی کند و همچنین توانایی زدن چند تیر در یک شب را نیز ندارد.اگر اسنایپر اشتباها تیری به شهروندان بازی بزند خودش از بازی حذف می شود و آن شهروند هیچ گونه آسیبی نمی بیند.';
                                        break;
                                      case 'جان سخت':
                                        role_about = 'نقش جان سخت در مافیا اینطور است که می‌تواند 24 ساعت بعد از این که به هر نحوی در معرض مرگ قرار گرفت، زنده بماند. مثلا وقتی به او شلیک شد یا اعدام شد سریعا نمی‌میرد بلکه بعد از گذشت 24 ساعت جانش را از دست می‌دهد، ولی از شلیک گلوله هم بی خبر است.او میتواند از افراد خارج شده از بازی استعلام بگیرد و بفهمد چه نقشی در بازی داشته اند.یعنی بعد از بیرون رفتن کشته شده ها گاد اعلام می کند که چه تعداد مافیا و چه تعداد شهروند خارج شده اند';
                                        break;
                                      case 'تفنگدار':
                                        role_about = 'نقش تفنگدار در بازی مافیا اینطور است که تیر دارد و می‌تواند آن تیرها را بذل و بخشش کند. شب، زمانی است که تفنگدار می‌توان تیرها را به کسانی که فکر می‌کند به آنها نیاز دارد- یعنی همان شهروندها- ببخشد.نمی‌تواند خودش از تیرش استفاده کند. تیرها می‌توانند اصلا به کسی داده نشوند و یا در یک شب همزمان به افراد داده شوند البته به هر کسی یک تیر.بعد از اینکه تفنگدار مافیا اعلام کرد که چه کسانی تفنگ داشته باشند دست آن ها توسط گاد لمس می شود و آن ها شب اجازه شات دارند';
                                        break;
                                      case 'قاضی':
                                        role_about = 'نقش قاضی در مافیا به این صورت است که می تواند یکبار نتیجه رای گیری روز را تغییر دهد یعنی یا باطل یا ملغی کند، بدین صورت که بعد از وصیت بازیکن و اعلام نتیجه حذف، در شب قاضی بیدار شده و نظر خود را در رابطه با حذف یا عدم حذف اعلام می کند و در روز نتیجه رای قاضی توسط گاد اعلام می شود';
                                        break;
                                      case 'روانپزشک':
                                        role_about = 'در شب با اشاره به یکی از بازی کن ها فقط یک نفر را می تواند در روز بعد سایلنت کند';
                                        break;
                                      case 'قهرمان':
                                        role_about = 'نقش قهرمان در مافیا به این صورت است که هر دو شب می تواند 24 ساعت یکی را بیمه کند که از هر اتفاقی در امان باشد';
                                        break;
                                      case 'کشیش':
                                        role_about = 'نقش کشیش در بازی مافیا بدین صورت است که باید تشخیص بدهد که چه کسی توسط ناتاشا سایلنت شده می‌تواند برایش دعا بخواند و او را از سایلنت بودن خارج کند. اگر کسی که کشیش انتخاب کند درست نباشد و سایلنت نبوده باشد، نطق اضافه دریافت می‌کند';
                                        break;
                                      case 'هکر':
                                        role_about = 'هکر در شب دوم بازی، یک لیست سه نفره به گاد می‌دهد. گاد با توجه به این که این سه نفر چه نقشی دارند، یک جمله را فردای آن شب اعلام می‌کند\n لیست خطرناک است: یک مافیا در لیست وجود داشته باشد\n لیست خطرناک نیست: هیچ مافیایی وجود نداشته باشد یا تعداد مافیاها بیشتر از یکی باشد';
                                        break;
                                      case 'محافظ':
                                        role_about = 'محافظ نقشی شهروندی است که در شب به هیچ عنوان حذف نمی شود مگر اینکه توسط ساقی گیج شو که در این صورت نقش محافظ بودن خود را از دست می دهد و میتواند کشته شود.اگر محافظ در رای گیری روز رای بیاورد گاد با اعلام نقش او، خاصیت محافظ بودن او را میگیرد و تبدیل به یک شهروند ساده می شود.';
                                        break;
                                      case 'فدایی':
                                        role_about = 'به این صورت است که وقتی که در روز رای گیری شد و او را از بازی خارج می کنند دستش را سمت فرد مورد نظزش میگیرد و او را همراه خود از بازی خارج می کند و جانش را برای شهر فدا می کند';
                                        break;
                                      case 'جادوگر':
                                        role_about = 'از اعضای شهروندان است و یک یا چندبار در شب و یا در روز می‌تواند سایر اعضا را جادو کند. کسی که جادو بشود قابلیت‌های خودش را از 24 ساعت دست می‌دهد.جادوگر در مافیا می‌تواند از قابلیتی که دارد استفاده نکند و اگر اینطور بود این خبر توسط گاد اعلام می‌شود';
                                        break;
                                      case 'فرشته':
                                        role_about = 'فرشته می‌تواند یک بار کسی را که کشته شده به بازی برگرداند. حتی اگر آن یک نفر خودش باشد، او روی کارت فرصت آخر نام بازیک را نوشته و به گاد می دهد و او بازیکن را به بازی بر میگرداند.فرشته نجات بسته به شرایط باید سامت باشد یا به موقع کار خود را اجام دهد در کل باید حواسش باشد که شخصیت خود را تابلو نکند';
                                        break;
                                      case 'نانوا':
                                        role_about = 'نانوا وظیفه پخت نان برای شهر را دارد. اگر به هر دلیلی از بازی حذف شود، بعد از سه شبانه روز، شهروندها از قحظی و گرسنگی میمیرند و بازی به نفع مافیا تمام می‌شود.اگر در بازی گرگ نما وجود داشته باشد بازی به نفع گرگ نما و اگر نباشد به نفع مافیا تمام می شود';
                                        break;
                                      case 'ساقی':
                                        role_about = 'ساقی دارای عملکرد شب است به این صورت که یکی از افراد را انتخاب می کند و به گاد نشان می دهد و اون شخص را گیج و منگ می کند.ساقی یک شب درمیان می تواند نام کسی را بدهد و نمیتواند یک فرد را دوباره انتخاب کند.ساقی می تواند برای جلوگیری از پیچدگی بازی نام خودش را به گاد بدهد';
                                        break;
                                      case 'فرمانده':
                                        role_about = 'فرمانده پس از اسنایپر در شب از خواب بیدار می شود و گاد هدف اسنایپر به فرمانده اعلام میکند.فرمانده می تواند رد یا تایید کند اگر رد شود خشاب به تفنگ اسنایپر باز میگردد';
                                        break;
                                      case 'نگهبان':
                                        role_about = 'نقش نگهبان در بازی مافیا به این صورت است که او همانند پزشک از اشخاص مهم نگهبانی میکند و قبل از بیدار شدن مافیا فرد را انتخاب می کند.یعنی شب انتخاب می کند که از چه کسی محافطت کند.اگر اون گروگانگیر مافیا را پیدا کند، از او مراقبت میکند و اجازه نمیدهد که از خانه خود خارج شود و در نتیجه کسی گروگان گرفته نمی شود و بدین صورت ریشه گروگان گیری مشخص می شود';
                                        break;
                                      case 'تکاور':
                                        role_about = 'تکاور هر شب از خواب بیدار میود و از گاد به او می گوید که مورد حمله مافیا قرار گرفته است یا خیر. اگر که مورد هدف مافیا باشد ب نوعی به تک تیرانداز تبدیل شده و می تواند به مافیا شلیک کند.اگر مافیا را بزند چه پزشک او را نجات داده باشد چه نه در بازی می ماند و اگر شهروند را بزند از بازی حذف می شود.نکاور تنها و تنها فقط یک تیر دارد';
                                        break;
                                      case 'زندانبان':
                                        role_about = 'زندانبان در مافیا توانایی آن را ارد که دوشب یک بازیکن را به زندان بفرستد به ین صورت که نه چیزی میبیند و نه چیزی می شنود.زندانبان با شهروندان است پس باید حواسش باشد که شهروندان را به زندان نندازد';
                                        break;
                                      case 'وکیل':
                                        role_about = 'نقش وکیل بسیار حیاتی است به این صورت که می تواند یکبار در بازی موکل خود را انتخاب کند و تا انتهای بازی به کمک کند.نکته قابل توجه این است که اگر موکل در این بازی به مرحله رای گیری برسد زمانی که باید از بازی بیرون رود، وکیل نام او را روی کاغذ نوشته و به گاد میدهد و اینطوری او از بازی بیرون نخواهد رفت';
                                        break;
                                      case 'بمبر':
                                        role_about = 'بمبر نقشش به این صورت است که اگر از بازی حذف شود دو طرف هم جوار خودش را منفجر میکند و همراه خود از بازی بیرون می اندازد.بمبر هر زمان که بخواهد می تواند انتحاری بزند و خودش و اطرافیانش را از بازی بیرون بیاندازد.اگر کسی کنار بمبر نباشد ینی آن که از بازی حذف شده باشند کسانی که در دایره اصلی باشند منفجر خواهند شد';
                                        break;
                                      case 'گورکن':
                                        role_about = 'گورکن یک شخصیت شهروندی است که در واقع در شب به گاد می تواند اعلام کند که میخواهد نقش قبر کند. روز که می شود گاد اعلام می کند که چه نقش هایی بیرون رفتن و هم شهروندان و هم مافیا آگاه می شوند';
                                        break;
                                    }
                                    mm = '2';
                                    role_title = selected_vi[index];
                                    _roleDoc();
                                  });
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
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
                                  child: Center(
                                      child: Text(selected_vi[index],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold))),
                                ),
                              ))),
                )),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            RolRan(
                              all: selected_ma + selected_vi,
                              nume: widget.plnam.length,
                              player_names: widget.plnam,
                              mafia_list: selected_ma,
                              villager_list: selected_vi,
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


      floatingActionButton: Visibility(
        visible: vi,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.92,
          height: MediaQuery.of(context).size.height * 0.93,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(change_name, style: TextStyle(fontSize: 22,color: sel_col)),
              ),
              Container(
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
                width: MediaQuery.of(context).size.width * 0.75,
                height: 400,
                child: ResponsiveGridList(
                  horizontalGridMargin: 50,
                  verticalGridMargin: 50,
                  minItemWidth: 110,
                  children: List.generate(all_sel.length, (index) =>
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            if(all_sel == all_ma){
                              selected_ma[sel_role] = all_sel[index];
                              print(selected_ma);
                            }
                            if(all_sel == all_vil){
                              selected_vi[sel_role] = all_sel[index];
                              print(selected_vi);
                            }
                            vi = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                                border: Border(
                                  top: BorderSide(color: sel_col,width: 2),
                                  left: BorderSide(color: sel_col,width: 2),
                                  right: BorderSide(color: sel_col,width: 2),
                                  bottom: BorderSide(color: sel_col,width: 2),
                                )
                          ),
                          height: 50,
                          child: Center(
                            child: Text(
                              all_sel[index],style: TextStyle(color: Colors.white,fontSize: 22),
                            ),
                          ),
                  ),
                      ))
                ),
              ),
              GestureDetector(
                onTap: (){setState(() {
                  vi = false;
                });},
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(1, 1, 1, 0),
                    border: Border(
                        top: BorderSide(color: sel_col,width: 2),
                        left: BorderSide(color: sel_col,width: 2),
                        right: BorderSide(color: sel_col,width: 2),
                        bottom: BorderSide(color: sel_col,width: 2),
                    ),
                        borderRadius: BorderRadius.circular(30)
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),

                ),
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
