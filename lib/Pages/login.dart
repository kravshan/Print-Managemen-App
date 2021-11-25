import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 40.0),
                child: Text(
                  'Print Manager',
                  style: TextStyle(
                    color: Colors.teal[700],
                    fontSize: 40.0
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  //color: Colors.teal[400],
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.teal[500],
                  ),
                  child: Center(
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Login',
                            style: TextStyle(
                              fontSize: 25.0
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 0.0),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter Email',
                              prefixIcon: Icon(Icons.email_outlined),
                              labelStyle: TextStyle(
                                color: Colors.black
                              ),
                              border: OutlineInputBorder()
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(8.0, 60.0, 8.0, 0.0),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter Password',
                              prefixIcon: Icon(Icons.security),
                                labelStyle: TextStyle(
                                    color: Colors.black
                                ),
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                          ),
                        ),

                      ],
                    ),
                  ),
                )
              ),
              SizedBox(height: 16.0,),
              RaisedButton(
                onPressed:(){

                  Navigator.pushReplacementNamed(context, '/pre_press');
                },
                child: Text('Sign In'),
                color: Colors.teal[500],

              )
            ],
          ),
        ),
      ),
    );
  }
}
