import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:print_management/Page%20Models/details_model.dart';
import 'package:print_management/Page%20Models/pre2_model.dart';
import 'package:print_management/Page%20Models/pre_model.dart';
import 'package:print_management/Services/backgound.dart';
import 'package:print_management/Services/logo_bar.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:excel/excel.dart';

class Summary extends StatefulWidget {
  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  late Box<PreModel> preBox;

  late Box<Pre2Model> pre2Box;

  late Box<DetailsModel> detailBox;

  late String date;
  late String quotation;
  late String name;
  late String job;

  late String pprType1 = '';
  late int rmsPkt1 = 0;
  late double? unitPrice1 = 0;
  late int? qty1 = 0;

  late String pprType2 = '';
  late int rmsPkt2 = 0;
  late double? unitPrice2 = 0;
  late int? qty2 = 0;

  late String pprType3 = '';
  late int rmsPkt3 = 0;
  late double? unitPrice3 = 0;
  late int? qty3 = 0;

  late String pprType4 = '';
  late int rmsPkt4 = 0;
  late double? unitPrice4 = 0;
  late int? qty4 = 0;

  late double? totalPaper = 0;

  late int? typuni = 0;
  late double? typuniprce = 0;
  late int? potouni = 0;
  late double? potouniprce = 0;
  late int? desuni = 0;
  late double? desuniprce = 0;
  late int? profuni = 0;
  late double? profuniprce = 0;
  late int? trauni = 0;
  late double? trauniprce = 0;

  getDetails(){
    date = detailBox.get('Entered details')!.date;
    quotation = detailBox.get('Entered details')!.quotation;
    name = detailBox.get('Entered details')!.clientName;
    job = detailBox.get('Entered details')!.job;
  }

  getpreBox(){
    pprType1 = preBox.get('pre1')!.paperType;
    rmsPkt1 = preBox.get('pre1')!.rmsPkt;
    unitPrice1 = preBox.get('pre1')!.unitPrice;

    pprType2 = preBox.get('pre2')!.paperType;
    rmsPkt2 = preBox.get('pre2')!.rmsPkt;
    unitPrice2 = preBox.get('pre2')!.unitPrice;

    pprType3 = preBox.get('pre3')!.paperType;
    rmsPkt3 = preBox.get('pre3')!.rmsPkt;
    unitPrice3 = preBox.get('pre3')!.unitPrice;

    pprType4 = preBox.get('pre4')!.paperType;
    rmsPkt4 = preBox.get('pre4')!.rmsPkt;
    unitPrice4 = preBox.get('pre4')!.unitPrice;
  }

  void getpre2Box(){
    typuni = pre2Box.get('pree')!.typeUnit;
    typuniprce = pre2Box.get('pree')!.typeUnitPrice;
    potouni = pre2Box.get('pree')!.photoUnit;
    potouniprce = pre2Box.get('pree')!.photoUnitPrice;
    desuni = pre2Box.get('pree')!.designUnit;
    desuniprce = pre2Box.get('pree')!.designUnitPrice;
    profuni = pre2Box.get('pree')!.proofUnit;
    profuniprce = pre2Box.get('pree')!.proofUnitPrice;
    trauni = pre2Box.get('pree')!.transUnit;
    trauniprce = pre2Box.get('pree')!.transUnitPrice;
  }

  void exportExcel() {
    final excel = Excel.createExcel();
    final sheet = excel[excel.getDefaultSheet()!];

    final paperCost = (unitPrice1!*qty1!) +(unitPrice2!*qty2!) + (unitPrice3!*qty3!) + (unitPrice4!*qty4!);
    final workCost = (typuni!*typuniprce!) + (potouni!*potouniprce!) + (desuni!*desuniprce!) + (profuni!*profuniprce!) + (trauni!*trauniprce!);
    final totalCost = paperCost+workCost;

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0)).value = 'Details';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 1)).value = 'Date';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 2)).value = 'Quotation No.';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 3)).value = 'Client Name';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 4)).value = 'Job Description';

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 6)).value = 'Paper Cost';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 7)).value = 'Paper/ Board/ Sticker/ Special Paper';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 8)).value = pprType1;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 9)).value = pprType2;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 10)).value = pprType3;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 11)).value = pprType4;

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 15)).value = 'Work Cost';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 17)).value = 'Type Setting';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 18)).value = 'Photography';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 19)).value = 'Design';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 20)).value = 'Proofing';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 21)).value = 'Translations';

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 1)).value = date;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 2)).value = quotation;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 3)).value = name;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 4)).value = job;

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 7)).value = 'RMS/PKT';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 8)).value = rmsPkt1;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 9)).value = rmsPkt2;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 10)).value = rmsPkt3;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 11)).value = rmsPkt4;

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 16)).value = 'Units';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 17)).value = typuni;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 18)).value = potouni;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 19)).value = desuni;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 20)).value = profuni;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 21)).value = trauni;

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 7)).value = 'Unit Price';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 8)).value = unitPrice1;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 9)).value = unitPrice2;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 10)).value = unitPrice3;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 11)).value = unitPrice4;

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 16)).value = 'Unit Price';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 17)).value = typuniprce;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 18)).value = potouniprce;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 19)).value = desuniprce;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 20)).value = profuniprce;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 21)).value = trauniprce;

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 13)).value = 'Total Paper Cost';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 13)).value = paperCost;

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 23)).value = 'Total Work Cost';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 23)).value = workCost;

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 25)).value = 'Total Cost';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 25)).value = totalCost;

    var file = excel.save(fileName: '$quotation.xlsx');
  }

  @override
  void initState(){
    super.initState();
    detailBox = Hive.box<DetailsModel>('details');
    preBox = Hive.box<PreModel>('pre');
    pre2Box = Hive.box<Pre2Model>('pre2');
    getDetails();
    getpreBox();
    getpre2Box();
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        const LogoBar(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Align(
            alignment: Alignment.center,
            child: Container(
                margin: EdgeInsets.fromLTRB(0, 120, 0, 0),
                height: 700,
                width: 1350,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.75),
                  borderRadius: BorderRadius.circular(40)
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text('Summary',
                        style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text('Date: $date',
                                  style: TextStyle(color: Colors.white, fontSize: 20),),
                                Text('Quotation No: $quotation',
                                  style: TextStyle(color: Colors.white, fontSize: 20),),
                                Text('Client Name: $name',
                                  style: TextStyle(color: Colors.white, fontSize: 20),),
                                Text('Job Description: $job',
                                  style: TextStyle(color: Colors.white, fontSize: 20),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 8, 4),
                                  child: Text(
                                    'Paper/ Board/ Sticker/ Special Paper',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  height: 44,
                                  width: 250,
                                  color: Colors.white,
                                  child: Text('$pprType1'),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  height: 44,
                                  width: 250,
                                  color: Colors.white,
                                  child: Text('$pprType2'),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  height: 44,
                                  width: 250,
                                  color: Colors.white,
                                  child: Text('$pprType3'),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  height: 44,
                                  width: 250,
                                  color: Colors.white,
                                  child: Text('$pprType4'),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 8, 4),
                                  child: Text(
                                    'RMS/PKT',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  height: 44,
                                  width: 250,
                                  color: Colors.white,
                                  child: Text('$rmsPkt1'),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  height: 44,
                                  width: 250,
                                  color: Colors.white,
                                  child: Text('$rmsPkt2'),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  height: 44,
                                  width: 250,
                                  color: Colors.white,
                                  child: Text('$rmsPkt3'),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  height: 44,
                                  width: 250,
                                  color: Colors.white,
                                  child: Text('$rmsPkt4'),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 8, 4),
                                  child: Text(
                                    'Unit Price',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  height: 44,
                                  width: 250,
                                  color: Colors.white,
                                  child: Text('$unitPrice1'),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  height: 44,
                                  width: 250,
                                  color: Colors.white,
                                  child: Text('$unitPrice2'),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  height: 44,
                                  width: 250,
                                  color: Colors.white,
                                  child: Text('$unitPrice3'),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  height: 44,
                                  width: 250,
                                  color: Colors.white,
                                  child: Text('$unitPrice4'),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 8, 4),
                                  child: Text(
                                    'Qty',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  height: 44,
                                  width: 250,
                                  color: Colors.white,
                                  child: Text('$qty1'),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  height: 44,
                                  width: 250,
                                  color: Colors.white,
                                  child: Text('$qty2'),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  height: 44,
                                  width: 250,
                                  color: Colors.white,
                                  child: Text('$qty3'),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  height: 44,
                                  width: 250,
                                  color: Colors.white,
                                  child: Text('$qty4'),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text('Total Paper Cost',
                                style: TextStyle(color: Colors.white),
                              ),
                              Container(
                                height: 44,
                                width: 250,
                                color: Colors.white,
                                child: Text('${(unitPrice1!*qty1!) +(unitPrice2!*qty2!) + (unitPrice3!*qty3!) + (unitPrice4!*qty4!)}'),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
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
                              Container(
                                margin: EdgeInsets.all(4),
                                height: 44,
                                width: 250,
                                color: Colors.white,
                                child: Text('$typuni'),
                              ),
                              Container(
                                margin: EdgeInsets.all(4),
                                height: 44,
                                width: 250,
                                color: Colors.white,
                                child: Text('$potouni'),
                              ),
                              Container(
                                margin: EdgeInsets.all(4),
                                height: 44,
                                width: 250,
                                color: Colors.white,
                                child: Text('$desuni'),
                              ),
                              Container(
                                margin: EdgeInsets.all(4),
                                height: 44,
                                width: 250,
                                color: Colors.white,
                                child: Text('$profuni'),
                              ),
                              Container(
                                margin: EdgeInsets.all(4),
                                height: 44,
                                width: 250,
                                color: Colors.white,
                                child: Text('$trauni'),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(4),
                                height: 44,
                                width: 250,
                                color: Colors.white,
                                child: Text('$typuniprce'),
                              ),
                              Container(
                                margin: EdgeInsets.all(4),
                                height: 44,
                                width: 250,
                                color: Colors.white,
                                child: Text('$potouniprce'),
                              ),
                              Container(
                                margin: EdgeInsets.all(4),
                                height: 44,
                                width: 250,
                                color: Colors.white,
                                child: Text('$desuniprce'),
                              ),
                              Container(
                                margin: EdgeInsets.all(4),
                                height: 44,
                                width: 250,
                                color: Colors.white,
                                child: Text('$profuniprce'),
                              ),
                              Container(
                                margin: EdgeInsets.all(4),
                                height: 44,
                                width: 250,
                                color: Colors.white,
                                child: Text('$trauniprce'),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text('Total Work Cost',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Container(
                                  height: 44,
                                  width: 250,
                                  color: Colors.white,
                                  child: Text('${(typuni!*typuniprce!) +
                                      (potouni!*potouniprce!) +
                                      (desuni!*desuniprce!) +
                                      (profuni!*profuniprce!) +
                                        (trauni!*trauniprce!)
                                  }'),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Total Pre-Press Cost',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Container(
                                  height: 44,
                                  width: 250,
                                  color: Colors.white,
                                  child: Text('${((typuni!*typuniprce!) +
                                      (potouni!*potouniprce!) +
                                      (desuni!*desuniprce!) +
                                      (profuni!*profuniprce!) +
                                      (trauni!*trauniprce!)) +
                                      (unitPrice1!*qty1!) +(unitPrice2!*qty2!) + (unitPrice3!*qty3!) + (unitPrice4!*qty4!)
                                  }'),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.all(16),
                            width: 250,
                            height: 63,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Back'),
                              color: const Color.fromARGB(255, 185, 140, 62),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(57)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(16),
                            width: 250,
                            height: 63,
                            child: RaisedButton(
                              onPressed: () {
                                exportExcel();
                              },
                              child: const Text('Export to Excel'),
                              color: const Color.fromARGB(255, 185, 140, 62),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(57)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(16),
                            width: 250,
                            height: 63,
                            child: RaisedButton(
                              onPressed: () {
                                detailBox.delete('Entered details');
                                preBox.delete('pre1');
                                preBox.delete('pre2');
                                preBox.delete('pre3');
                                preBox.delete('pre4');
                                pre2Box.delete('pree');

                                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                              },
                              child: const Text('Done'),
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
              ),
            ),
          ),
      ],
    );
  }
}
