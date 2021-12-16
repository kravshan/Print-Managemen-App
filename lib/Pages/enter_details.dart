import 'package:flutter/material.dart';
import 'package:print_management/Services/backgound.dart';
import 'package:print_management/Services/logo_bar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EnterDetails extends StatelessWidget {
  const EnterDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const Background(),
          const LogoBar(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 600,
                        width: 1200,
                        margin: EdgeInsets.fromLTRB(0, 110, 0, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 60),
                            padding: EdgeInsets.all(16),
                            height: 408,
                            width: 765,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.black.withOpacity(0.75)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  child: Text('1.Enter Details',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 30),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(vertical: 8),
                                            child: Text('Date',
                                            style: TextStyle(
                                              color: Colors.white
                                            ),),
                                          ),
                                          Container(
                                            height: 44,
                                            width: 310,
                                            color: Colors.white,
                                            child: const TextField(
                                              decoration: InputDecoration(
                                                border: InputBorder.none,

                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                                            child: Text('Quotation No.',
                                              style: TextStyle(
                                                  color: Colors.white
                                              ),),
                                          ),
                                          Container(
                                            height: 44,
                                            width: 310,
                                            margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
                                            color: Colors.white,
                                            child: const TextField(
                                              decoration: InputDecoration(
                                                border: InputBorder.none,

                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30, ),
                                  child: Text('Client Name',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 44,
                                  width: 670,
                                  margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                  color: Colors.white,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,

                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30,),
                                  child: Text('Job Description',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 44,
                                  width: 670,
                                  margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                  color: Colors.white,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1200,
                        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 218,
                              height: 63,
                              child: RaisedButton(
                                onPressed:(){
                                },
                                child: const Text('NEXT'),
                                color: Color.fromARGB(255, 185, 140, 62),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(57)),
                              ),
                            ),
                            SizedBox(
                              width: 218,
                              height: 63,
                              child: RaisedButton(
                                onPressed:(){Navigator.pop(context);},
                                child: const Text('DISCARD'),
                                color: Color.fromARGB(255, 185, 140, 62),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(57)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 250, 50, 0),
                        height: 360,
                        width: 360,
                        child: SfCalendar(
                          view: CalendarView.month,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
