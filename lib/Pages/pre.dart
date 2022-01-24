import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:print_management/Page%20Models/pre_model.dart';
import 'package:print_management/Services/backgound.dart';
import 'package:print_management/Services/logo_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Pre extends StatefulWidget {
  const Pre({Key? key}) : super(key: key);

  @override
  _PreState createState() => _PreState();
}

class _PreState extends State<Pre> {

  late Box<PreModel> preBox;

  final TextEditingController _paperType1 = TextEditingController();
  final TextEditingController _rmsPkt1 = TextEditingController();
  final TextEditingController? _unitPrice1 = TextEditingController();

  final TextEditingController _paperType2 = TextEditingController();
  final TextEditingController _rmsPkt2 = TextEditingController();
  final TextEditingController? _unitPrice2 = TextEditingController();

  final TextEditingController _paperType3 = TextEditingController();
  final TextEditingController _rmsPkt3 = TextEditingController();
  final TextEditingController? _unitPrice3 = TextEditingController();

  final TextEditingController _paperType4 = TextEditingController();
  final TextEditingController _rmsPkt4 = TextEditingController();
  final TextEditingController? _unitPrice4 = TextEditingController();

  late String pprTyp1;
  late int rmspkt1;
  late double untprce1 = 0;
  late int qt1 = 0;

  late String pprTyp2;
  late int rmspkt2;
  late double untprce2 = 0;
  late int qt2 = 0;

  late String pprTyp3;
  late int rmspkt3;
  late double untprce3 = 0;
  late int qt3 = 0;

  late String pprTyp4;
  late int rmspkt4;
  late double untprce4 = 0;
  late int qt4 = 0;

  late double result = 0;
  late double q1 = 0;
  late double q2 = 0;
  late double q3 = 0;
  late double q4 = 0;

  PprTypeCalc(){
    setState(() {
      q1 = (untprce1*rmspkt1);
      q2 = (untprce2*rmspkt2);
      q3 = (untprce3*rmspkt3);
      q4 = (untprce4*rmspkt4);
      result = q1 + q2 + q3 + q4;
    });
  }

  @override
  void initState(){
    super.initState();
    preBox = Hive.box<PreModel>('pre');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        const LogoBar(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10.w, 50.h, 0, 150.h),
                  width: 1500.w,
                  height: 750.h,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 600.h,
                      width: 1350.w,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.75),
                          borderRadius: BorderRadius.circular(40.r)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20.r),
                            child: Text(
                              'Pre-Press',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 8.h, 8.w, 4.h),
                                    child: Text(
                                      'Paper/ Board/ Sticker/ Special Paper',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.bottom,
                                      controller: _paperType1,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.bottom,
                                      controller: _paperType2,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.bottom,
                                      controller: _paperType3,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.bottom,
                                      controller: _paperType4,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 8.h, 8.w, 4.h),
                                    child: Text(
                                      'RMS/ PKT',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.bottom,
                                      controller: _rmsPkt1,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.bottom,
                                      controller: _rmsPkt2,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.bottom,
                                      controller: _rmsPkt3,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.bottom,
                                      controller: _rmsPkt4,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 8.h, 8.w, 4.h),
                                    child: Text(
                                      'Unit Price',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child:TextField(
                                      textAlignVertical: TextAlignVertical.bottom,
                                      controller: _unitPrice1,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.bottom,
                                      controller: _unitPrice2,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.bottom,
                                      controller: _unitPrice3,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.bottom,
                                      controller: _unitPrice4,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 8.h, 8.w, 4.h),
                                    child: Text(
                                      'Qty',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: Text('$q1'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: Text('$q2'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: Text('$q3'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: Text('$q4'),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 150.h, 20, 0),
                              height: 100.h,
                              width: 400.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 8.h, 8.w, 4.h),
                                    child: Text(
                                      'Paper/ Board/ Sticker Cost',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: Text('$result'),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 218.w,
                      height: 63.h,
                      child: RaisedButton(
                        onPressed: () {
                          pprTyp1 = _paperType1.text;
                          rmspkt1 = int.parse(_rmsPkt1.text);
                          if(_unitPrice1 == null){
                            untprce1 = 0.0;
                          }else{
                            untprce1 = double.parse(_unitPrice1!.text);
                          }

                          pprTyp2 = _paperType2.text;
                          rmspkt2 = int.parse(_rmsPkt2.text);
                          if(_unitPrice2 != null){
                            untprce2 = double.parse(_unitPrice2!.text);
                          }else{
                            untprce2 = 0.0;
                          }

                          pprTyp3 = _paperType3.text;
                          rmspkt3 = int.parse(_rmsPkt3.text);
                          if(_unitPrice3 != null){
                            untprce3 = double.parse(_unitPrice3!.text);
                          }else{
                            untprce3 = 0.0;
                          }

                          pprTyp4 = _paperType4.text;
                          rmspkt4 = int.parse(_rmsPkt4.text);
                          if(_unitPrice4 != null){
                            untprce4 = double.parse(_unitPrice4!.text);
                          }else{
                            untprce4 = 0.0;
                          }

                          PreModel pre1 = PreModel(pprTyp1, rmspkt1, untprce1);
                          PreModel pre2 = PreModel(pprTyp2, rmspkt2, untprce2);
                          PreModel pre3 = PreModel(pprTyp3, rmspkt3, untprce3);
                          PreModel pre4 = PreModel(pprTyp4, rmspkt4, untprce4);

                          preBox.put('pre1', pre1);
                          preBox.put('pre2', pre2);
                          preBox.put('pre3', pre3);
                          preBox.put('pre4', pre4);

                          PprTypeCalc();
                        },
                        child: Text('Calculate',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        color: const Color.fromARGB(255, 185, 140, 62),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(57)),
                      ),
                    ),
                    SizedBox(
                      width: 218.w,
                      height: 63.h,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, '/pre2');
                        },
                        child: Text('Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        color: const Color.fromARGB(255, 185, 140, 62),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(57)),
                      ),
                    ),
                    SizedBox(
                      width: 218.w,
                      height: 63.h,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('BACK',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        color: const Color.fromARGB(255, 185, 140, 62),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(57)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
