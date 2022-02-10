import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Calender extends StatelessWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
