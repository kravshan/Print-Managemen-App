import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pre2ActionsList extends StatelessWidget {
  const Pre2ActionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 19.h),
          child: Text(
            'Type Setting',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 19.h),
          child: Text(
            'Photography',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 19.h),
          child: Text(
            'Design',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 19.h),
          child: Text(
            'Proofing',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 19.h),
          child: Text(
            'Translations',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}
