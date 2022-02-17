import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './pre2.dart';
import '../Services/pre_summary.dart';
import '../Services/pre_row_list.dart';
import '../Services/pre_row.dart';
import '../Services/backgound.dart';
import '../Services/entered_details_summary.dart';
import '../Services/logo_bar.dart';

class Pre extends StatefulWidget {
  final EnteredDetailsSummary _summaryOne;
  Pre(this._summaryOne);

  @override
  _PreState createState() => _PreState(_summaryOne);
}

class _PreState extends State<Pre> {
  final EnteredDetailsSummary _summaryOne;
  _PreState(this._summaryOne);

  final List<Map<String, Object>> _preRows = [];

  late double result = 0;
  late double q = 0;

  pprTypeCalc() {
    result = 0;
    setState(() {
      for (int i = 0; i < _preRows.length; i++) {
        result += _preRows[i]['Qty'] as double;
      }
    });
  }

  void addNewPreRow(
      String paperType, double rmsPkt, double unitPrice, double qt) {
    setState(() {
      _preRows.add({
        'Paper Type': paperType,
        'RMS/PKT': rmsPkt,
        'Unit Price': unitPrice,
        'Qty': qt
      });
    });
  }

  void _startAddNewPreRow(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: Colors.black.withOpacity(0.75),
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: PreRow(addNewPreRow),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _nextOnPressed() {
    final PreSummary tx = PreSummary(_summaryOne, _preRows, result);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext ctx) => Pre2(tx),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        const LogoBar(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(50.w, 180.h, 0, 60.h),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(40.r)),
                width: 1500.w,
                height: 750.h,
                child: Column(
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
                    SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 570.h,
                              child: PreRowList(_preRows),
                            ),
                          ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200.w,
                          height: 55.h,
                          child: RaisedButton(
                            onPressed: () => _startAddNewPreRow(context),
                            child: Text(
                              'ADD',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            color: const Color.fromARGB(255, 185, 140, 62),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(57)),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(30, 10.h, 0, 0),
                              height: 100.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0, 8.h, 8.w, 4.h),
                                    child: Text(
                                      'Paper/ Board/ Sticker Cost',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                  result == 0
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
                                            child: Text(
                                              '$result',
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 218.w,
                    height: 63.h,
                    child: RaisedButton(
                      onPressed: pprTypeCalc,
                      child: Text(
                        'Calculate',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500),
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
                        if (_preRows.isNotEmpty) {
                          _nextOnPressed();
                        } else {
                          return;
                        }
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
                      child: Text(
                        'BACK',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500),
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
        )
      ],
    );
  }
}
