import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pre2UnitsList extends StatelessWidget {
  final TextEditingController typeUnit;
  final TextEditingController photoUnit;
  final TextEditingController designUnit;
  final TextEditingController proofUnit;
  final TextEditingController transUnit;

  Pre2UnitsList(
    this.typeUnit,
    this.photoUnit,
    this.designUnit,
    this.proofUnit,
    this.transUnit,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Units',
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
            controller: typeUnit,
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
            controller: photoUnit,
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
            controller: designUnit,
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
            controller: proofUnit,
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
            controller: transUnit,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
