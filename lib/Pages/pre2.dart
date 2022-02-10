import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Services/pre2_actions_list.dart';
import '../Services/pre2_qty_list.dart';
import '../Services/pre2_unit_price_list.dart';
import '../Services/pre2_units_list.dart';
import '../Services/backgound.dart';
import '../Services/logo_bar.dart';
import '../Services/pre_summary.dart';

class Pre2 extends StatefulWidget {
  final PreSummary _summaryTwo;

  Pre2(this._summaryTwo);

  @override
  _Pre2State createState() => _Pre2State(_summaryTwo);
}

class _Pre2State extends State<Pre2> {
  final PreSummary _summaryTwo;
  _Pre2State(this._summaryTwo);

  final TextEditingController _typeUnit = TextEditingController();
  final TextEditingController _photoUnit = TextEditingController();
  final TextEditingController _designUnit = TextEditingController();
  final TextEditingController _proofUnit = TextEditingController();
  final TextEditingController _transUnit = TextEditingController();

  final TextEditingController _typeUnitPrice = TextEditingController();
  final TextEditingController _photoUnitPrice = TextEditingController();
  final TextEditingController _designUnitPrice = TextEditingController();
  final TextEditingController _proofUnitPrice = TextEditingController();
  final TextEditingController _transUnitPrice = TextEditingController();

  var qty1 = 0.0;
  var qty2 = 0.0;
  var qty3 = 0.0;
  var qty4 = 0.0;
  var qty5 = 0.0;
  var resultpre2 = 0.0;

  void _calculateQty() {
    final typuni = int.parse(_typeUnit.text);
    final potouni = int.parse(_photoUnit.text);
    final desuni = int.parse(_photoUnit.text);
    final profuni = int.parse(_proofUnit.text);
    final trauni = int.parse(_transUnit.text);

    final typuniprce = double.parse(_typeUnitPrice.text);
    final potouniprce = double.parse(_photoUnitPrice.text);
    final desuniprce = double.parse(_designUnitPrice.text);
    final profuniprce = double.parse(_proofUnitPrice.text);
    final trauniprce = double.parse(_transUnitPrice.text);

    setState(() {
      qty1 = typuni * typuniprce;
      qty2 = potouni * potouniprce;
      qty3 = desuni * desuniprce;
      qty4 = profuni * profuniprce;
      qty5 = trauni * trauniprce;

      resultpre2 = qty1 + qty2 + qty3 + qty4 + qty5;
    });
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
                              const Pre2ActionsList(),
                              Pre2UnitsList(
                                _typeUnit,
                                _photoUnit,
                                _designUnit,
                                _proofUnit,
                                _transUnit,
                              ),
                              Pre2UnitPriceList(
                                  _typeUnitPrice,
                                  _photoUnitPrice,
                                  _designUnitPrice,
                                  _proofUnitPrice,
                                  _transUnitPrice),
                              Pre2QtyList(
                                qty1,
                                qty2,
                                qty3,
                                qty4,
                                qty5,
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
                                    padding:
                                        EdgeInsets.fromLTRB(0, 8.h, 8.w, 4.h),
                                    child: Text(
                                      'Total Pre-Press Cost',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                  resultpre2 == 0
                                      ? Container(
                                          height: 44.h,
                                          width: 310.w,
                                          color: Colors.white,
                                        )
                                      : Container(
                                          height: 44.h,
                                          width: 310.w,
                                          color: Colors.white,
                                          child: Center(
                                              child: Text('$resultpre2')),
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
                        onPressed: _calculateQty,
                        child: Text(
                          'Calculate',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
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
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
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
                        child: Text(
                          'BACK',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
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
