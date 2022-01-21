import 'package:flutter/material.dart';
import 'package:print_management/Page%20Models/details_model.dart';
import 'package:print_management/Page%20Models/pre2_model.dart';
import 'package:print_management/Page%20Models/pre_model.dart';
import 'package:print_management/Pages/pre.dart';
import 'package:print_management/Pages/pre2.dart';
import 'package:print_management/Pages/summary.dart';
import 'package:print_management/Pages/press.dart';
import 'package:print_management/Pages/post_press.dart';
import 'package:print_management/Pages/login.dart';
import 'package:print_management/Pages/enter_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.init("E:/Print Management");
  Hive.registerAdapter(PreModelAdapter());
  Hive.registerAdapter(Pre2ModelAdapter());
  Hive.registerAdapter(DetailsModelAdapter());
  runApp(ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: () =>
          MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => Login(),
              '/enter_details': (context) => FutureBuilder(
                future: Hive.openBox<DetailsModel>('details'),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasError){
                      return Text(snapshot.error.toString());
                    }else{
                      return EnterDetails();
                    }
                  }else{
                    return const Scaffold();
                  }
                },
              ),
              '/pre': (context) => FutureBuilder(
                future: Hive.openBox<PreModel>('pre'),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasError){
                      return Text(snapshot.error.toString());
                    }else{
                      return Pre();
                    }
                  }else{
                    return const Scaffold();
                  }
                }
              ),
              '/pre2': (context) => FutureBuilder(
                future: Hive.openBox<Pre2Model>('pre2'),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasError){
                      return Text(snapshot.error.toString());
                    }else{
                      return Pre2();
                    }
                  }else{
                    return const Scaffold();
                  }
                }
              ),
              '/summary': (context) => Summary(),
              '/press': (context) => FutureBuilder(
                future: Hive.openBox<PreModel>('press'),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasError){
                      return Text(snapshot.error.toString());
                    }else{
                      return Press();
                    }
                  }else{
                    return const Scaffold();
                  }
                },
              ),
              '/post_press': (context)  => FutureBuilder(
                future: Hive.openBox<dynamic>('post_press'),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasError){
                      return Text(snapshot.error.toString());
                    }else{
                      return PostPress();
                    }
                  }else{
                    return const Scaffold();
                  }
                },
              ),
            },
          )
  ));
}
