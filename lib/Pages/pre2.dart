import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:print_management/Page%20Models/pre2_model.dart';
import 'package:print_management/Services/backgound.dart';
import 'package:print_management/Services/logo_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Pre2 extends StatefulWidget {
  const Pre2({Key? key}) : super(key: key);

  @override
  _Pre2State createState() => _Pre2State();
}

class _Pre2State extends State<Pre2> {

  late Box<Pre2Model> pre2Box;

  final TextEditingController _typeUnit = TextEditingController();
  final TextEditingController _typeUnitPrice = TextEditingController();

  final TextEditingController _photoUnit = TextEditingController();
  final TextEditingController _photoUnitPrice = TextEditingController();

  final TextEditingController _designUnit = TextEditingController();
  final TextEditingController _designUnitPrice = TextEditingController();

  final TextEditingController _proofUnit = TextEditingController();
  final TextEditingController _proofUnitPrice = TextEditingController();

  final TextEditingController _transUnit = TextEditingController();
  final TextEditingController _transUnitPrice = TextEditingController();

  late int typuni;
  late double typuniprce;
  late int potouni;
  late double potouniprce;
  late int desuni;
  late double desuniprce;
  late int profuni;
  late double profuniprce;
  late int trauni;
  late double trauniprce;

  late double qty1 = 0;
  late double qty2 = 0;
  late double qty3 = 0;
  late double qty4 = 0;
  late double qty5 = 0;

  late double resultpre2 = 0;

  pre2Calc(){
    setState(() {
      qty1 = typuni*typuniprce;
      qty2 = potouni*potouniprce;
      qty3 = desuni*desuniprce;
      qty4 = profuni*profuniprce;
      qty5 = trauni*trauniprce;

      resultpre2 = qty1 + qty2 + qty3 + qty4 + qty5;
    });
  }

  @override
  void initState(){
    super.initState();
    pre2Box = Hive.box<Pre2Model>('pre2');
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
                            padding: EdgeInsets.all(20.sp),
                            child: Text(
                              'Pre-Press',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 19.h),
                                    child: Text('Type Setting', style: TextStyle(color: Colors.white, fontSize: 16.sp,),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 19.h),
                                    child: Text('Photography', style: TextStyle(color: Colors.white, fontSize: 16.sp,),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 19.h),
                                    child: Text('Design', style: TextStyle(color: Colors.white, fontSize: 16.sp,),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 19.h),
                                    child: Text('Proofing', style: TextStyle(color: Colors.white, fontSize: 16.sp,),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 19.h),
                                    child: Text('Translations', style: TextStyle(color: Colors.white, fontSize: 16.sp,),),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Units', style: TextStyle(color: Colors.white, fontSize: 16.sp,),),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.bottom,
                                      controller: _typeUnit,
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
                                      controller: _photoUnit,
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
                                      controller: _designUnit,
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
                                      controller: _proofUnit,
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
                                      controller: _transUnit,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Unit Price', style: TextStyle(color: Colors.white,fontSize: 16.sp,),),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: TextField(
                                      textAlignVertical: TextAlignVertical.bottom,
                                      controller: _typeUnitPrice,
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
                                      controller: _photoUnitPrice,
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
                                      controller: _designUnitPrice,
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
                                      controller: _proofUnitPrice,
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
                                      controller: _transUnitPrice,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('QTY', style: TextStyle(color: Colors.white, fontSize: 16.sp,),),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: Text('${qty1}')
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: Text('${qty2}')
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: Text('${qty3}')
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: Text('${qty4}')
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4.h),
                                    height: 44.h,
                                    width: 310.w,
                                    color: Colors.white,
                                    child: Text('${qty5}')
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 150.h, 20, 0),
                              height: 100.h,
                              width: 400.w,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 8.h, 8.w, 4.h),
                                    child: Text(
                                      'Total Pre-Press Cost',
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
                                    child: Text('${resultpre2}'),
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
                          typuni = int.parse(_typeUnit.text);
                          typuniprce = double.parse(_typeUnitPrice.text);

                          potouni = int.parse(_photoUnit.text);
                          potouniprce = double.parse(_photoUnitPrice.text);

                          desuni = int.parse(_designUnit.text);
                          desuniprce = double.parse(_designUnitPrice.text);

                          profuni = int.parse(_proofUnit.text);
                          profuniprce = double.parse(_proofUnitPrice.text);

                          trauni = int.parse(_transUnit.text);
                          trauniprce = double.parse(_transUnitPrice.text);

                          Pre2Model pre2 = Pre2Model(typuni, typuniprce, potouni, potouniprce, desuni, desuniprce, profuni, profuniprce, trauni, trauniprce);

                          pre2Box.put('pree', pre2);

                          pre2Calc();
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
                            borderRadius: BorderRadius.circular(57.r)),
                      ),
                    ),
                    SizedBox(
                      width: 218.w,
                      height: 63.h,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/summary');
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
                            borderRadius: BorderRadius.circular(57.r)),
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
                            borderRadius: BorderRadius.circular(57.r)),
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
