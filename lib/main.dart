import 'package:flutter/material.dart';
import 'package:print_management/Pages/pre_press.dart';
import 'package:print_management/Pages/press.dart';
import 'package:print_management/Pages/post_press.dart';
import 'package:print_management/Pages/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(document.path);
  runApp(ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: () =>
          MaterialApp(
            initialRoute: '/',
            routes: {
              '/': (context) => Login(),
              '/pre_press': (context) => FutureBuilder(
                future: Hive.openBox('pre_press'),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasError){
                      return Text(snapshot.error.toString());
                    }else{
                      return PrePress();
                    }
                  }else{
                    return const Scaffold();
                  }
                }
              ),
              '/press': (context) => FutureBuilder(
                future: Hive.openBox('press'),
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



