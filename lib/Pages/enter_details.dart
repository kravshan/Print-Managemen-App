import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:print_management/Page%20Models/details_model.dart';
import 'package:print_management/Services/backgound.dart';
import 'package:print_management/Services/logo_bar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EnterDetails extends StatefulWidget {
  const EnterDetails({Key? key}) : super(key: key);

  @override
  State<EnterDetails> createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {

  late Box<DetailsModel> detailBox;

  final TextEditingController _date = TextEditingController();
  final TextEditingController _quotation = TextEditingController();
  final TextEditingController _clientName = TextEditingController();
  final TextEditingController _job = TextEditingController();


  @override
  void initState() {
    super.initState();
    detailBox = Hive.box<DetailsModel>('details');
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
                          child: Container(
                            padding: EdgeInsets.all(16.sp),
                            height: 408.h,
                            width: 765.w,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.r),
                              color: Colors.black.withOpacity(0.75)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                                  child: Text('1.Enter Details',
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
                                            child: Text('Date',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.sp
                                            ),),
                                          ),
                                          Container(
                                            height: 44.h,
                                            width: 310.w,
                                            color: Colors.white,
                                            child: TextField(
                                              textAlignVertical: TextAlignVertical.bottom,
                                              controller: _date,
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
                                            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 50.w),
                                            child: Text('Quotation No.',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.sp
                                              ),),
                                          ),
                                          Container(
                                            height: 44.h,
                                            width: 310.w,
                                            margin: EdgeInsets.fromLTRB(50.w, 0, 0, 0),
                                            color: Colors.white,
                                            child: TextField(
                                              textAlignVertical: TextAlignVertical.bottom,
                                              controller: _quotation,
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
                                  padding: EdgeInsets.symmetric(horizontal: 30.w, ),
                                  child: Text('Client Name',
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
                                    controller: _clientName,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30.w,),
                                  child: Text('Job Description',
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
                                    controller: _job,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,

                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                                onPressed:(){
                                  final String dat = _date.text;
                                  final String qut = _quotation.text;
                                  final String name = _clientName.text;
                                  final String jobb = _job.text;

                                  DetailsModel detail = DetailsModel(dat, qut, name, jobb);
                                  detailBox.put('Entered details', detail);

                                  Navigator.pushNamed(context, '/pre');
                                },
                                child: Text('NEXT',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                color: const Color.fromARGB(255, 185, 140, 62),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(57)),
                              ),
                            ),
                            SizedBox(
                              width: 218.w,
                              height: 63.h,
                              child: RaisedButton(
                                onPressed:(){Navigator.pop(context);},
                                child: Text('DISCARD',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                color: const Color.fromARGB(255, 185, 140, 62),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(57.r)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(50.w, 550.h, 0, 0),
                        height: 360.h,
                        width: 360.w,
                        child: SfCalendar(
                          view: CalendarView.month,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
