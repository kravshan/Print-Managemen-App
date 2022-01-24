import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:print_management/Services/backgound.dart';
import 'package:print_management/Services/logo_bar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const Background(),
          const LogoBar(),
          Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 218.w,
                        height: 63.h,
                        child: RaisedButton(
                          onPressed:(){
                            Navigator.pushNamed(context, '/enter_details');
                          },
                          child: Text('Start New',
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
                          onPressed:(){
                          },
                          child: Text('Previous QUT',
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
                          onPressed:(){
                            Navigator.pushReplacementNamed(context, '/pre_press');
                          },
                          child: Text('Database',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          color: const Color.fromARGB(255, 185, 140, 62),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(57)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 70.h,),

                ],
              ),
            ),
          ),
        ),]
      ),
    );
  }
}
