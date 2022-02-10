import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pre2UnitPriceList extends StatelessWidget {
  final TextEditingController typeUnitPrice;
  final TextEditingController photoUnitPrice;
  final TextEditingController designUnitPrice;
  final TextEditingController proofUnitPrice;
  final TextEditingController transUnitPrice;

  Pre2UnitPriceList(
    this.typeUnitPrice,
    this.photoUnitPrice,
    this.designUnitPrice,
    this.proofUnitPrice,
    this.transUnitPrice,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Unit Price',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 4.h),
          height: 44.h,
          width: 310.w,
          color: Colors.white,
          child: TextField(
            textAlignVertical: TextAlignVertical.bottom,
            controller: typeUnitPrice,
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
            controller: photoUnitPrice,
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
            controller: designUnitPrice,
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
            controller: proofUnitPrice,
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
            controller: transUnitPrice,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
