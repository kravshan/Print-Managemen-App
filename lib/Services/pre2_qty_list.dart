import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pre2QtyList extends StatelessWidget {
  final qty1;
  final qty2;
  final qty3;
  final qty4;
  final qty5;

  Pre2QtyList(
    this.qty1,
    this.qty2,
    this.qty3,
    this.qty4,
    this.qty5,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'QTY',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
          ),
        ),
        qty1 == 0
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 4.h),
                height: 44.h,
                width: 310.w,
                color: Colors.white,
              )
            : Container(
                margin: EdgeInsets.symmetric(vertical: 4.h),
                height: 44.h,
                width: 310.w,
                color: Colors.white,
                child: Center(child: Text('$qty1'))),
        qty2 == 0
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 4.h),
                height: 44.h,
                width: 310.w,
                color: Colors.white,
              )
            : Container(
                margin: EdgeInsets.symmetric(vertical: 4.h),
                height: 44.h,
                width: 310.w,
                color: Colors.white,
                child: Center(child: Text('$qty2'))),
        qty3 == 0
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 4.h),
                height: 44.h,
                width: 310.w,
                color: Colors.white,
              )
            : Container(
                margin: EdgeInsets.symmetric(vertical: 4.h),
                height: 44.h,
                width: 310.w,
                color: Colors.white,
                child: Center(child: Text('$qty3'))),
        qty4 == 0
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 4.h),
                height: 44.h,
                width: 310.w,
                color: Colors.white,
              )
            : Container(
                margin: EdgeInsets.symmetric(vertical: 4.h),
                height: 44.h,
                width: 310.w,
                color: Colors.white,
                child: Center(child: Text('$qty4'))),
        qty5 == 0
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 4.h),
                height: 44.h,
                width: 310.w,
                color: Colors.white,
              )
            : Container(
                margin: EdgeInsets.symmetric(vertical: 4.h),
                height: 44.h,
                width: 310.w,
                color: Colors.white,
                child: Center(child: Text('$qty5'))),
      ],
    );
  }
}
