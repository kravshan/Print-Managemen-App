import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnteredDetailsContainer extends StatelessWidget {
  final TextEditingController date;
  final TextEditingController quotation;
  final TextEditingController clientName;
  final TextEditingController job;

  EnteredDetailsContainer({
    required this.date,
    required this.quotation,
    required this.clientName,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      height: 408.h,
      width: 765.w,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          color: Colors.black.withOpacity(0.75)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Text(
              '1.Enter Details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Text(
                        'Date',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    Container(
                      height: 44.h,
                      width: 310.w,
                      color: Colors.white,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: date,
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
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 50.w),
                      child: Text(
                        'Quotation No.',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    Container(
                      height: 44.h,
                      width: 310.w,
                      margin: EdgeInsets.fromLTRB(50.w, 0, 0, 0),
                      color: Colors.white,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: quotation,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: Text(
              'Client Name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
              ),
            ),
          ),
          Container(
            height: 44.h,
            width: 670.w,
            margin: EdgeInsets.fromLTRB(30.w, 0, 0, 0),
            color: Colors.white,
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              controller: clientName,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: Text(
              'Job Description',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
              ),
            ),
          ),
          Container(
            height: 44.h,
            width: 670.w,
            margin: EdgeInsets.fromLTRB(30.w, 0, 0, 0),
            color: Colors.white,
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              controller: job,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
