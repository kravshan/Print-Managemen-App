import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './Pages/login.dart';
import './Pages/enter_details.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Login(),
          '/enter_details': (context) => EnterDetails(),
        },
      ),
    ),
  );
}
