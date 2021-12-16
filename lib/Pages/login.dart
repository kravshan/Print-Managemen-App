import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:print_management/Services/backgound.dart';
import 'package:print_management/Services/logo_bar.dart';

class Login extends StatefulWidget {
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
                        width: 218,
                        height: 63,
                        child: RaisedButton(
                          onPressed:(){
                            Navigator.pushReplacementNamed(context, '/enter_details');
                          },
                          child: const Text('Start New'),
                          color: const Color.fromARGB(255, 185, 140, 62),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(57)),
                        ),
                      ),
                      SizedBox(
                        width: 218,
                        height: 63,
                        child: RaisedButton(
                          onPressed:(){
                          },
                          child: const Text('Previous QUT'),
                          color: Color.fromARGB(255, 185, 140, 62),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(57)),
                        ),
                      ),
                      SizedBox(
                        width: 218,
                        height: 63,
                        child: RaisedButton(
                          onPressed:(){
                            Navigator.pushReplacementNamed(context, '/pre_press');
                          },
                          child: const Text('Database'),
                          color: Color.fromARGB(255, 185, 140, 62),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(57)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16.h,),

                ],
              ),
            ),
          ),
        ),]
      ),
    );
  }
}
