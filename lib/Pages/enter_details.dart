import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './entered_details_container.dart';
import './pre.dart';
import '../Services/entered_details_summary.dart';
import '../Services/backgound.dart';
import '../Services/logo_bar.dart';
import '../Services/calender.dart';

class EnterDetails extends StatelessWidget {
  final TextEditingController date = TextEditingController();
  final TextEditingController quotation = TextEditingController();
  final TextEditingController clientName = TextEditingController();
  final TextEditingController job = TextEditingController();

  EnterDetails({Key? key}) : super(key: key);

  void _nextOnPressed(BuildContext context) {
    final EnteredDetailsSummary tx = EnteredDetailsSummary(
      date.text,
      quotation.text,
      clientName.text,
      job.text,
    );
    Navigator.push(
        (context), MaterialPageRoute(builder: (BuildContext ctx) => Pre(tx)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const Background(),
          const LogoBar(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 600.h,
                      width: 1100.w,
                      margin: EdgeInsets.fromLTRB(0, 140.h, 0, 140.h),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: EnteredDetailsContainer(
                          date: date,
                          quotation: quotation,
                          clientName: clientName,
                          job: job,
                        ),
                      ),
                    ),
                    Container(
                      width: 1000.w,
                      margin: EdgeInsets.fromLTRB(0, 50.h, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 218.w,
                            height: 63.h,
                            child: RaisedButton(
                              onPressed: () {
                                if (date.text.isNotEmpty ||
                                    quotation.text.isNotEmpty ||
                                    clientName.text.isNotEmpty ||
                                    job.text.isNotEmpty) {
                                  _nextOnPressed(context);
                                } else {
                                  return;
                                }
                              },
                              child: Text(
                                'NEXT',
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
                                'DISCARD',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              color: const Color.fromARGB(255, 185, 140, 62),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(57.r)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Calender(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
