import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './pre2_actions_list.dart';

class SummaryOfPre2 extends StatelessWidget {
  final typuni;
  final potouni;
  final desuni;
  final profuni;
  final trauni;

  final typuniprce;
  final potouniprce;
  final desuniprce;
  final profuniprce;
  final trauniprce;

  final qty1;
  final qty2;
  final qty3;
  final qty4;
  final qty5;

  final resultpre2;

  SummaryOfPre2({
    required this.desuni,
    required this.desuniprce,
    required this.potouni,
    required this.potouniprce,
    required this.profuni,
    required this.profuniprce,
    required this.qty1,
    required this.qty2,
    required this.qty3,
    required this.qty4,
    required this.qty5,
    required this.resultpre2,
    required this.trauni,
    required this.trauniprce,
    required this.typuni,
    required this.typuniprce,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Pre2ActionsList(),
        Column(
          children: [
            const Text(
              'Units',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              height: 44.h,
              width: 250.w,
              color: Colors.white,
              child: Center(child: Text('$typuni')),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              height: 44.h,
              width: 250.w,
              color: Colors.white,
              child: Center(child: Text('$potouni')),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              height: 44.h,
              width: 250.w,
              color: Colors.white,
              child: Center(child: Text('$desuni')),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              height: 44.h,
              width: 250.w,
              color: Colors.white,
              child: Center(child: Text('$profuni')),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              height: 44.h,
              width: 250.w,
              color: Colors.white,
              child: Center(child: Text('$trauni')),
            ),
          ],
        ),
        Column(
          children: [
            const Text(
              'Unit Price',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              height: 44.h,
              width: 250.w,
              color: Colors.white,
              child: Center(child: Text('$typuniprce')),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              height: 44.h,
              width: 250.w,
              color: Colors.white,
              child: Center(child: Text('$potouniprce')),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              height: 44.h,
              width: 250.w,
              color: Colors.white,
              child: Center(child: Text('$desuniprce')),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              height: 44.h,
              width: 250.w,
              color: Colors.white,
              child: Center(child: Text('$profuniprce')),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              height: 44.h,
              width: 250.w,
              color: Colors.white,
              child: Center(child: Text('$trauniprce')),
            ),
          ],
        ),
        Column(
          children: [
            const Text(
              'QTY',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              height: 44.h,
              width: 250.w,
              color: Colors.white,
              child: Center(child: Text('$qty1')),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              height: 44.h,
              width: 250.w,
              color: Colors.white,
              child: Center(child: Text('$qty2')),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              height: 44.h,
              width: 250.w,
              color: Colors.white,
              child: Center(child: Text('$qty3')),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              height: 44.h,
              width: 250.w,
              color: Colors.white,
              child: Center(child: Text('$qty4')),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              height: 44.h,
              width: 250.w,
              color: Colors.white,
              child: Center(child: Text('$qty5')),
            ),
          ],
        ),
      ],
    );
  }
}
