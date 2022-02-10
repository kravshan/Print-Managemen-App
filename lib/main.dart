import 'package:flutter/material.dart';
import 'package:print_management/Pages/summary.dart';
import 'package:print_management/Pages/login.dart';
import 'package:print_management/Pages/enter_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.init("E:/Print Management");
  runApp(ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: () => MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => const Login(),
              '/enter_details': (context) => EnterDetails(),
              '/summary': (context) => Summary(),
            },
          )));
}
