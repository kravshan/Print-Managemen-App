import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoBar extends StatelessWidget {
  const LogoBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white.withOpacity(0.48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
              padding: EdgeInsets.all(40.sp),
              child: SizedBox(
                width: 346.w,
                height: 75.h,
                child: const Image(image: AssetImage('assets/Dw.png'),
                ),
              )
          )
        ],
      ),);
  }
}
