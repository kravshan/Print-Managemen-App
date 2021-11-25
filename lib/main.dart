import 'package:flutter/material.dart';
import 'package:print_management/Pages/pre_press.dart';
import 'package:print_management/Pages/press.dart';
import 'package:print_management/Pages/post_press.dart';
import 'package:print_management/Pages/login.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Login(),
    '/pre_press': (context) => PrePress(),
    '/press': (context) => Press(),
    '/post_press': (context) => PostPress(),
  },
));



