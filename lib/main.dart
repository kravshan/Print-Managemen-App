import 'package:flutter/material.dart';
import 'package:print_management/Pages/pre_press.dart';
import 'package:print_management/Pages/press.dart';
import 'package:print_management/Pages/post_press.dart';
import 'package:print_management/Pages/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(ScreenUtilInit(
  designSize: const Size(1920, 1080),
  builder: ()=> MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/pre_press': (context) => PrePress(),
      '/press': (context) => Press(),
      '/post_press': (context) => PostPress(),
    },
  )
));



