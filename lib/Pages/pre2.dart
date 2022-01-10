import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:print_management/Page%20Models/pre2_model.dart';
import 'package:print_management/Services/backgound.dart';
import 'package:print_management/Services/logo_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Pre2 extends StatefulWidget {
  @override
  _Pre2State createState() => _Pre2State();
}

class _Pre2State extends State<Pre2> {

  late Box<Pre2Model> pre2Box;

  final TextEditingController _typeUnit = TextEditingController();
  final TextEditingController _typeUnitPrice = TextEditingController();

  final TextEditingController _photoUnit = TextEditingController();
  final TextEditingController _photoUnitPrice = TextEditingController();

  final TextEditingController _designUnit = TextEditingController();
  final TextEditingController _designUnitPrice = TextEditingController();

  final TextEditingController _proofUnit = TextEditingController();
  final TextEditingController _proofUnitPrice = TextEditingController();

  final TextEditingController _transUnit = TextEditingController();
  final TextEditingController _transUnitPrice = TextEditingController();

  late int typuni;
  late double typuniprce;
  late int potouni;
  late double potouniprce;
  late int desuni;
  late double desuniprce;
  late int profuni;
  late double profuniprce;
  late int trauni;
  late double trauniprce;

  late double qty1 = 0;
  late double qty2 = 0;
  late double qty3 = 0;
  late double qty4 = 0;
  late double qty5 = 0;

  late double resultpre2 = 0;

  pre2Calc(){
    setState(() {
      qty1 = typuni*typuniprce;
      qty2 = potouni*potouniprce;
      qty3 = desuni*desuniprce;
      qty4 = profuni*profuniprce;
      qty5 = trauni*trauniprce;

      resultpre2 = qty1 + qty2 + qty3 + qty4 + qty5;
    });
  }

  @override
  void initState(){
    super.initState();
    pre2Box = Hive.box<Pre2Model>('pre2');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        const LogoBar(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 50, 0, 20),
                  width: 1500,
                  height: 750,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 600,
                      width: 1350,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.75),
                          borderRadius: BorderRadius.circular(40)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              'Pre-Press',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 19.0),
                                    child: Text('Type Setting', style: TextStyle(color: Colors.white),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 19.0),
                                    child: Text('Photography', style: TextStyle(color: Colors.white),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 19.0),
                                    child: Text('Design', style: TextStyle(color: Colors.white),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 19.0),
                                    child: Text('Proofing', style: TextStyle(color: Colors.white),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 19.0),
                                    child: Text('Translations', style: TextStyle(color: Colors.white),),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Units', style: TextStyle(color: Colors.white),),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: TextField(
                                      controller: _typeUnit,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: TextField(
                                      controller: _photoUnit,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: TextField(
                                      controller: _designUnit,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: TextField(
                                      controller: _proofUnit,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: TextField(
                                      controller: _transUnit,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Unit Price', style: TextStyle(color: Colors.white),),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: TextField(
                                      controller: _typeUnitPrice,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: TextField(
                                      controller: _photoUnitPrice,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: TextField(
                                      controller: _designUnitPrice,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: TextField(
                                      controller: _proofUnitPrice,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: TextField(
                                      controller: _transUnitPrice,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('QTY', style: TextStyle(color: Colors.white),),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: Text('${qty1}')
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: Text('${qty2}')
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: Text('${qty3}')
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: Text('${qty4}')
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: Text('${qty5}')
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 150, 20, 0),
                              height: 100,
                              width: 400,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 8, 8, 4),
                                    child: Text(
                                      'Total Pre-Press Cost',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: Text('${resultpre2}'),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 218,
                      height: 63,
                      child: RaisedButton(
                        onPressed: () {
                          typuni = int.parse(_typeUnit.text);
                          typuniprce = double.parse(_typeUnitPrice.text);

                          potouni = int.parse(_photoUnit.text);
                          potouniprce = double.parse(_photoUnitPrice.text);

                          desuni = int.parse(_designUnit.text);
                          desuniprce = double.parse(_designUnitPrice.text);

                          profuni = int.parse(_proofUnit.text);
                          profuniprce = double.parse(_proofUnitPrice.text);

                          trauni = int.parse(_transUnit.text);
                          trauniprce = double.parse(_transUnitPrice.text);

                          Pre2Model pre2 = Pre2Model(typuni, typuniprce, potouni, potouniprce, desuni, desuniprce, profuni, profuniprce, trauni, trauniprce);

                          pre2Box.put('pree', pre2);

                          pre2Calc();
                        },
                        child: const Text('Calculate'),
                        color: const Color.fromARGB(255, 185, 140, 62),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(57)),
                      ),
                    ),
                    SizedBox(
                      width: 218,
                      height: 63,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/summary');
                        },
                        child: const Text('Next'),
                        color: const Color.fromARGB(255, 185, 140, 62),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(57)),
                      ),
                    ),
                    SizedBox(
                      width: 218,
                      height: 63,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('BACK'),
                        color: const Color.fromARGB(255, 185, 140, 62),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(57)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
