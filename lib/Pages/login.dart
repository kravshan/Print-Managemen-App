import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 60.h, 0.0, 40.h),
                  child: Text(
                    'Print Manager',
                    style: TextStyle(
                      color: Colors.teal[700],
                      fontSize: 40.sp
                    ),
                  ),
                ),
                SizedBox(height: 16.h,),
                RaisedButton(
                  onPressed:(){
                    Navigator.pushReplacementNamed(context, '/pre_press');
                  },
                  child: Text('BEGIN'),
                  color: Colors.teal[500],

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
