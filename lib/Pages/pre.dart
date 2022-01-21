import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:print_management/Page%20Models/pre_model.dart';
import 'package:print_management/Services/backgound.dart';
import 'package:print_management/Services/logo_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Pre extends StatefulWidget {
  @override
  _PreState createState() => _PreState();
}

class _PreState extends State<Pre> {

  late Box<PreModel> preBox;

  final TextEditingController _paperType1 = TextEditingController();
  final TextEditingController _rmsPkt1 = TextEditingController();
  final TextEditingController? _unitPrice1 = TextEditingController();

  final TextEditingController _paperType2 = TextEditingController();
  final TextEditingController _rmsPkt2 = TextEditingController();
  final TextEditingController? _unitPrice2 = TextEditingController();

  final TextEditingController _paperType3 = TextEditingController();
  final TextEditingController _rmsPkt3 = TextEditingController();
  final TextEditingController? _unitPrice3 = TextEditingController();

  final TextEditingController _paperType4 = TextEditingController();
  final TextEditingController _rmsPkt4 = TextEditingController();
  final TextEditingController? _unitPrice4 = TextEditingController();

  late String pprTyp1;
  late int rmspkt1;
  late double untprce1 = 0;
  late int qt1 = 0;

  late String pprTyp2;
  late int rmspkt2;
  late double untprce2 = 0;
  late int qt2 = 0;

  late String pprTyp3;
  late int rmspkt3;
  late double untprce3 = 0;
  late int qt3 = 0;

  late String pprTyp4;
  late int rmspkt4;
  late double untprce4 = 0;
  late int qt4 = 0;

  late double result = 0;
  late double q1 = 0;
  late double q2 = 0;
  late double q3 = 0;
  late double q4 = 0;

  PprTypeCalc(){
    setState(() {
      q1 = (untprce1*rmspkt1);
      q2 = (untprce2*rmspkt2);
      q3 = (untprce3*rmspkt3);
      q4 = (untprce4*rmspkt4);
      result = q1 + q2 + q3 + q4;
    });
  }

  @override
  void initState(){
    super.initState();
    preBox = Hive.box<PreModel>('pre');
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 8, 8, 4),
                                    child: Text(
                                      'Paper/ Board/ Sticker/ Special Paper',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: TextField(
                                      controller: _paperType1,
                                      decoration: InputDecoration(
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
                                      controller: _paperType2,
                                      decoration: InputDecoration(
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
                                      controller: _paperType3,
                                      decoration: InputDecoration(
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
                                      controller: _paperType4,
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
                                    padding: EdgeInsets.fromLTRB(0, 8, 8, 4),
                                    child: Text(
                                      'RMS/ PKT',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: TextField(
                                      controller: _rmsPkt1,
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
                                      controller: _rmsPkt2,
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
                                      controller: _rmsPkt3,
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
                                      controller: _rmsPkt4,
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
                                    padding: EdgeInsets.fromLTRB(0, 8, 8, 4),
                                    child: Text(
                                      'Unit Price',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child:TextField(
                                      controller: _unitPrice1,
                                      decoration: InputDecoration(
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
                                      controller: _unitPrice2,
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
                                      controller: _unitPrice3,
                                      decoration: InputDecoration(
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
                                      controller: _unitPrice4,
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
                                    padding: EdgeInsets.fromLTRB(0, 8, 8, 4),
                                    child: Text(
                                      'Qty',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: Text('$q1'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: Text('$q2'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: Text('$q3'),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: Text('$q4'),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          // ValueListenableBuilder(
                          //   valueListenable: preBox.listenable(),
                          //   builder: (context, Box<PreModel> pree, _){
                          //     List<int> keys = pree.keys.cast<int>().toList();
                          //     return ListView.separated(
                          //       itemBuilder: (_, index){
                          //         print('gotcha1');
                          //         final int key = keys[index];
                          //         print('gotcha2');
                          //         final PreModel? _pre = pree.get(key);
                          //         print('gotcha3');
                          //         return Row(
                          //           children: [
                          //             Container(
                          //               padding: EdgeInsets.all(8),
                          //               height: 44,
                          //               width: 310,
                          //               color: Colors.white,
                          //               child: Text(_pre!.paperType),
                          //             ),
                          //             Container(
                          //               padding: EdgeInsets.all(8),
                          //               height: 44,
                          //               width: 310,
                          //               color: Colors.white,
                          //               child: Text(_pre.rmsPkt),
                          //             ),
                          //             Container(
                          //               padding: EdgeInsets.all(8),
                          //               height: 44,
                          //               width: 310,
                          //               color: Colors.white,
                          //               child: Text('${_pre.unitPrice}'),
                          //             ),
                          //             Container(
                          //               padding: EdgeInsets.all(8),
                          //               height: 44,
                          //               width: 310,
                          //               color: Colors.white,
                          //               child: Text('${_pre.qty}'),
                          //             )
                          //           ],
                          //         );
                          //       },
                          //       separatorBuilder: (_, index) => Divider(),
                          //       itemCount: keys.length,
                          //       shrinkWrap: true,
                          //     );
                          //   }
                          // ),
                          // Center(
                          //   child: RaisedButton(
                          //     onPressed: () {
                          //       showDialog(
                          //           context: context,
                          //           builder: (context) {
                          //             return Dialog(
                          //                 backgroundColor:
                          //                     Colors.black.withOpacity(0.8),
                          //                 child: SizedBox(
                          //                   height: 210,
                          //                   width: 1500,
                          //                   child: Row(
                          //                     mainAxisAlignment:
                          //                         MainAxisAlignment.spaceAround,
                          //                     children: [
                          //                       Column(
                          //                         children: [
                          //                           const Padding(
                          //                             padding:
                          //                                 EdgeInsets.all(8.0),
                          //                             child: Text(
                          //                               'Paper/ Board/ Sticker/ Special Paper',
                          //                               style: TextStyle(
                          //                                   color:
                          //                                       Colors.white),
                          //                             ),
                          //                           ),
                          //                           Container(
                          //                             height: 44,
                          //                             width: 310,
                          //                             color: Colors.white,
                          //                             child: TextField(
                          //                               controller: _paperType,
                          //                               decoration: const InputDecoration(
                          //                                 border: InputBorder.none,
                          //                               ),
                          //                             ),
                          //                           ),
                          //                         ],
                          //                       ),
                          //                       Column(
                          //                         children: [
                          //                           const Padding(
                          //                             padding:
                          //                                 EdgeInsets.all(8.0),
                          //                             child: Text(
                          //                               'RMS/ PKT',
                          //                               style: TextStyle(
                          //                                   color: Colors.white),
                          //                             ),
                          //                           ),
                          //                           Container(
                          //                             height: 44,
                          //                             width: 310,
                          //                             color: Colors.white,
                          //                             child: TextField(
                          //                               controller: _rmsPkt,
                          //                               decoration: const InputDecoration(
                          //                                 border: InputBorder.none,
                          //                               ),
                          //                             ),
                          //                           ),
                          //                           const SizedBox(height: 40,),
                          //                           Container(
                          //                             width: 218,
                          //                             height: 63,
                          //                             child: RaisedButton(
                          //                               onPressed: () {
                          //                                 final String pprType = _paperType.text;
                          //                                 final String rmspkt = _rmsPkt.text;
                          //                                 final double untprce = double.parse(_unitPrice.text);
                          //                                 final int qty = int.parse(_qty.text);
                          //
                          //                                 PreModel pre = PreModel(pprType, rmspkt, untprce, qty);
                          //                                 preBox.add(pre);
                          //
                          //                                 Navigator.pop(context);
                          //                               },
                          //                               child: const Text('ADD'),
                          //                               color: const Color.fromARGB(255, 185, 140, 62),
                          //                               shape: RoundedRectangleBorder(
                          //                                   borderRadius: BorderRadius.circular(57)),
                          //                             ),
                          //                           ),
                          //                         ],
                          //                       ),
                          //                       Column(
                          //                         children: [
                          //                           const Padding(
                          //                             padding:
                          //                                 EdgeInsets.all(8.0),
                          //                             child: Text(
                          //                               'Unit Price',
                          //                               style: TextStyle(
                          //                                   color:
                          //                                       Colors.white),
                          //                             ),
                          //                           ),
                          //                           Container(
                          //                             height: 44,
                          //                             width: 310,
                          //                             color: Colors.white,
                          //                             child: TextField(
                          //                               controller: _unitPrice,
                          //                               decoration: const InputDecoration(
                          //                                 border: InputBorder.none,
                          //                               ),
                          //                             ),
                          //                           ),
                          //                           SizedBox(height: 40,),
                          //                           Container(
                          //                             width: 218,
                          //                             height: 63,
                          //                             child: RaisedButton(
                          //                               onPressed: () {
                          //                                 Navigator.pop(context);
                          //                               },
                          //                               child: const Text('CANCEL'),
                          //                               color: const Color.fromARGB(255, 185, 140, 62),
                          //                               shape: RoundedRectangleBorder(
                          //                                   borderRadius: BorderRadius.circular(57)),
                          //                             ),
                          //                           ),
                          //                         ],
                          //                       ),
                          //                       Column(
                          //                         children: [
                          //                           const Padding(
                          //                             padding:
                          //                                 EdgeInsets.all(8.0),
                          //                             child: Text(
                          //                               'Qty',
                          //                               style: TextStyle(
                          //                                   color:
                          //                                       Colors.white),
                          //                             ),
                          //                           ),
                          //                           Container(
                          //                             height: 44,
                          //                             width: 310,
                          //                             color: Colors.white,
                          //                             child: TextField(
                          //                               decoration: const InputDecoration(
                          //                                 border: InputBorder.none,
                          //                               ),
                          //                               controller: _qty,
                          //                             ),
                          //                           ),
                          //                         ],
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ));
                          //           });
                          //     },
                          //     child: const Text('Add New'),
                          //     shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(57)),
                          //   ),
                          // )
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 150, 20, 0),
                              height: 100,
                              width: 400,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 8, 8, 4),
                                    child: Text(
                                      'Paper/ Board/ Sticker Cost',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    height: 44,
                                    width: 310,
                                    color: Colors.white,
                                    child: Text('${result}'),
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
                          pprTyp1 = _paperType1.text;
                          rmspkt1 = int.parse(_rmsPkt1.text);
                          if(_unitPrice1 == null){
                            untprce1 = 0.0;
                          }else{
                            untprce1 = double.parse(_unitPrice1!.text);
                          }

                          pprTyp2 = _paperType2.text;
                          rmspkt2 = int.parse(_rmsPkt2.text);
                          if(_unitPrice2 != null){
                            untprce2 = double.parse(_unitPrice2!.text);
                          }else{
                            untprce2 = 0.0;
                          }

                          pprTyp3 = _paperType3.text;
                          rmspkt3 = int.parse(_rmsPkt3.text);
                          if(_unitPrice3 != null){
                            untprce3 = double.parse(_unitPrice3!.text);
                          }else{
                            untprce3 = 0.0;
                          }

                          pprTyp4 = _paperType4.text;
                          rmspkt4 = int.parse(_rmsPkt4.text);
                          if(_unitPrice4 != null){
                            untprce4 = double.parse(_unitPrice4!.text);
                          }else{
                            untprce4 = 0.0;
                          }

                          PreModel pre1 = PreModel(pprTyp1, rmspkt1, untprce1);
                          PreModel pre2 = PreModel(pprTyp2, rmspkt2, untprce2);
                          PreModel pre3 = PreModel(pprTyp3, rmspkt3, untprce3);
                          PreModel pre4 = PreModel(pprTyp4, rmspkt4, untprce4);

                          preBox.put('pre1', pre1);
                          preBox.put('pre2', pre2);
                          preBox.put('pre3', pre3);
                          preBox.put('pre4', pre4);

                          PprTypeCalc();
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
                          Navigator.pushNamed(
                              context, '/pre2');
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
