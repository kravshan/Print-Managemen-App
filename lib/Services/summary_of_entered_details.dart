import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummaryOfEnteredDetails extends StatelessWidget {
  final String date;
  final String quotation;
  final String name;
  final String job;

  SummaryOfEnteredDetails(this.date, this.quotation, this.name, this.job);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date: $date',
            style: TextStyle(color: Colors.white, fontSize: 20.sp),
          ),
          Text(
            'Quotation No: $quotation',
            style: TextStyle(color: Colors.white, fontSize: 20.sp),
          ),
          Text(
            'Client Name: $name',
            style: TextStyle(color: Colors.white, fontSize: 20.sp),
          ),
          Text(
            'Job Description: $job',
            style: TextStyle(color: Colors.white, fontSize: 20.sp),
          ),
        ],
      ),
    );
  }
}
