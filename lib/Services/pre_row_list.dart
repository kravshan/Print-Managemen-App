import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreRowList extends StatelessWidget {
  final List<Map<String, Object>> preRows;

  PreRowList(this.preRows);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 590.h,
      width: 1340.w,
      child: preRows.isEmpty
          ? const Center(
              child: Text(
                'No Data Added!',
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Colors.black.withOpacity(0.9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
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
                              child: Center(
                                  child:
                                      Text('${preRows[index]['Paper Type']}')),
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
                              child: Center(
                                  child: Text('${preRows[index]['RMS/PKT']}')),
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
                              child: Center(
                                  child:
                                      Text('${preRows[index]['Unit Price']}')),
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
                              child: Center(
                                  child: Text('${preRows[index]['Qty']}')),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: preRows.length,
            ),
    );
  }
}
