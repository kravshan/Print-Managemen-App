import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:print_management/Page%20Models/details_model.dart';
import 'package:print_management/Services/backgound.dart';
import 'package:print_management/Services/logo_bar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EnterDetails extends StatefulWidget {
  @override
  State<EnterDetails> createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {

  late Box<DetailsModel> detailBox;

  TextEditingController _date = TextEditingController();
  TextEditingController _quotation = TextEditingController();
  TextEditingController _clientName = TextEditingController();
  TextEditingController _job = TextEditingController();


  @override
  void initState() {
    super.initState();
    detailBox = Hive.box<DetailsModel>('details');
  }

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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 600,
                          width: 1100,
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
                                              child: TextField(
                                                controller: _date,
                                                decoration: const InputDecoration(
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
                                              child: TextField(
                                                controller: _quotation,
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
                                    child: TextField(
                                      controller: _clientName,
                                      decoration: const InputDecoration(
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
                                    child: TextField(
                                      controller: _job,
                                      decoration: const InputDecoration(
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
                          width: 1100,
                          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 218,
                                height: 63,
                                child: RaisedButton(
                                  onPressed:(){
                                    final String dat = _date.text;
                                    final String qut = _quotation.text;
                                    final String name = _clientName.text;
                                    final String jobb = _job.text;

                                    DetailsModel detail = DetailsModel(dat, qut, name, jobb);
                                    detailBox.put('Entered details', detail);

                                    Navigator.pushNamed(context, '/pre');
                                  },
                                  child: const Text('NEXT'),
                                  color: const Color.fromARGB(255, 185, 140, 62),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(57)),
                                ),
                              ),
                              SizedBox(
                                width: 218,
                                height: 63,
                                child: RaisedButton(
                                  onPressed:(){Navigator.pop(context);},
                                  child: const Text('DISCARD'),
                                  color: const Color.fromARGB(255, 185, 140, 62),
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
                          margin: const EdgeInsets.fromLTRB(0, 250, 0, 0),
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
