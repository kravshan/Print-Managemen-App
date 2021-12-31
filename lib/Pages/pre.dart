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

  final TextEditingController _paperType = TextEditingController();
  final TextEditingController _rmsPkt = TextEditingController();
  final TextEditingController _unitPrice = TextEditingController();
  final TextEditingController _qty = TextEditingController();

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
                      child: SingleChildScrollView(
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
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Paper/ Board/ Sticker/ Special Paper',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'RMS/ PKT',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Unit Price',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Qty',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  height: 44,
                                  width: 310,
                                  color: Colors.white,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  height: 44,
                                  width: 310,
                                  color: Colors.white,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  height: 44,
                                  width: 310,
                                  color: Colors.white,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
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
                            const SizedBox(
                              height: 8,
                            ),
                            ValueListenableBuilder(
                              valueListenable: preBox.listenable(),
                              builder: (context, Box<PreModel> pree, _){
                                List<int> keys = pree.keys.cast<int>().toList();
                                return SizedBox(
                                  height: 500,
                                  width: 1350,
                                  child: ListView.separated(
                                    itemBuilder: (_, index){
                                      final int key = keys[index];
                                      final PreModel? pre = pree.get(key);
                                      return Row(
                                        children: [
                                          Container(
                                            height: 44,
                                            width: 310,
                                            color: Colors.white,
                                            child: Text(pre!.paperType),
                                          ),
                                          Container(
                                            height: 44,
                                            width: 310,
                                            color: Colors.white,
                                            child: Text(pre.rmsPkt),
                                          ),
                                          Container(
                                            height: 44,
                                            width: 310,
                                            color: Colors.white,
                                            child: Text('${pre.unitPrice}'),
                                          ),
                                          Container(
                                            height: 44,
                                            width: 310,
                                            color: Colors.white,
                                            child: Text('${pre.qty}'),
                                          )
                                        ],
                                      );
                                    },
                                    separatorBuilder: (_, index) => Divider(),
                                    itemCount: keys.length
                                  ),
                                );
                              }
                            ),
                            Center(
                              child: RaisedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                            backgroundColor:
                                                Colors.black.withOpacity(0.8),
                                            child: SizedBox(
                                              height: 210,
                                              width: 1500,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: [
                                                  Column(
                                                    children: [
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          'Paper/ Board/ Sticker/ Special Paper',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 44,
                                                        width: 310,
                                                        color: Colors.white,
                                                        child: TextField(
                                                          controller: _paperType,
                                                          decoration: const InputDecoration(
                                                            border: InputBorder.none,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          'RMS/ PKT',
                                                          style: TextStyle(
                                                              color: Colors.white),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 44,
                                                        width: 310,
                                                        color: Colors.white,
                                                        child: TextField(
                                                          controller: _rmsPkt,
                                                          decoration: const InputDecoration(
                                                            border: InputBorder.none,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 40,),
                                                      Container(
                                                        width: 218,
                                                        height: 63,
                                                        child: RaisedButton(
                                                          onPressed: () {
                                                            final String pprType = _paperType.text;
                                                            final String rmspkt = _rmsPkt.text;
                                                            final untprce = double.parse(_unitPrice.text);
                                                            final qty = int.parse(_qty.value.text);

                                                            PreModel pre = PreModel(pprType, rmspkt, untprce, qty);
                                                            preBox.add(pre);
                                                            Navigator.pop(context);
                                                          },
                                                          child: const Text('ADD'),
                                                          color: const Color.fromARGB(255, 185, 140, 62),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(57)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          'Unit Price',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 44,
                                                        width: 310,
                                                        color: Colors.white,
                                                        child: TextField(
                                                          controller: _unitPrice,
                                                          decoration: const InputDecoration(
                                                            border: InputBorder.none,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 40,),
                                                      Container(
                                                        width: 218,
                                                        height: 63,
                                                        child: RaisedButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: const Text('CANCEL'),
                                                          color: const Color.fromARGB(255, 185, 140, 62),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(57)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          'Qty',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 44,
                                                        width: 310,
                                                        color: Colors.white,
                                                        child: TextField(
                                                          decoration: const InputDecoration(
                                                            border: InputBorder.none,
                                                          ),
                                                          controller: _qty,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ));
                                      });
                                },
                                child: const Text('Add New'),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(57)),
                              ),
                            )
                          ],
                        ),
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
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/pre', (route) => false);
                        },
                        child: const Text('NEXT'),
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
                        child: const Text('DISCARD'),
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
