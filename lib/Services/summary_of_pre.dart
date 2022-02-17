import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './pre_row_list.dart';

class SummaryOfPre extends StatelessWidget {
  final List<Map<String, Object>> preRows;
  final double preResult;

  SummaryOfPre(this.preRows, this.preResult);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...preRows.map((index) {
          return Card(
            color: Colors.black.withOpacity(0.9),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 8.h, 8.w, 4.h),
                          child: Text(
                            'Paper/ Board/ Sticker/ Special Paper',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        Container(
                          height: 44.h,
                          width: 250.w,
                          color: Colors.white,
                          child: Center(child: Text('${index['Paper Type']}')),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 8.h, 8.w, 4.h),
                          child: Text(
                            'RMS/ PKT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        Container(
                          height: 44.h,
                          width: 250.w,
                          color: Colors.white,
                          child: Center(child: Text('${index['RMS/PKT']}')),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 8.h, 8.w, 4.h),
                          child: Text(
                            'Unit Price',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        Container(
                          height: 44.h,
                          width: 250.w,
                          color: Colors.white,
                          child: Center(child: Text('${index['Unit Price']}')),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 8.h, 8.w, 4.h),
                          child: Text(
                            'Qty',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        Container(
                          height: 44.h,
                          width: 250.w,
                          color: Colors.white,
                          child: Center(child: Text('${index['Qty']}')),
                        ),
                      ],
                    ),
                  ),
                ]),
          );
        }).toList(),
        // Column(
        //   children: [
        //     Text(
        //       'Total Paper Cost',
        //       style: TextStyle(color: Colors.white, fontSize: 14.sp),
        //     ),
        //     Container(
        //       height: 44.h,
        //       width: 250.w,
        //       color: Colors.white,
        //       child: Text(
        //           '${(unitPrice1! * qty1!) + (unitPrice2! * qty2!) + (unitPrice3! * qty3!) + (unitPrice4! * qty4!)}'),
        //     )
        //   ],
        // ),
        Text(
          'Total Paper Cost',
          style: TextStyle(color: Colors.white, fontSize: 14.sp),
        ),
        Container(
          height: 44.h,
          width: 250.w,
          color: Colors.white,
          child: Center(child: Text('$preResult')),
        ),
      ],
    );
  }
}
