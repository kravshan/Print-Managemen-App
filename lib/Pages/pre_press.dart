import 'package:flutter/material.dart';
import 'package:print_management/Services/table_cell.dart';
import 'package:print_management/Services/table_topic.dart';
import 'package:hive/hive.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:print_management/Services/insert.dart';

class PrePress extends StatefulWidget {
  @override
  State<PrePress> createState() => _PrePressState();
}

class _PrePressState extends State<PrePress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pre-Press Stage'),
        centerTitle: true,
        backgroundColor: Colors.teal[500],
      ),
      body: PrePressTable(),
    );
  }

  @override
  void dispose(){
    Hive.box('pre_press').close();
    super.dispose();
  }
}

class PrePressTable extends StatefulWidget {

  @override
  State<PrePressTable> createState() => _PrePressTableState();
}

class _PrePressTableState extends State<PrePressTable> {

  var box = Hive.box<dynamic>('pre_press');
  late double num1;
  late double num2;
  late double num3;
  late double num4;
  late double num5;
  late double num6;
  late double num7;
  late double num8;

  double result = 0;
  double totalResult = 0;

  final TextEditingController _typeSetting = TextEditingController();
  final TextEditingController _photography = TextEditingController();
  final TextEditingController _color = TextEditingController();
  final TextEditingController _separation = TextEditingController();
  final TextEditingController _design = TextEditingController();
  final TextEditingController _transportation = TextEditingController();
  final TextEditingController _unitCostController = TextEditingController();
  final TextEditingController _plateController = TextEditingController();

  void calculateResult(){
    setState(() {
      result = num1*num2;
      totalResult = result + num3 + num4 + num5 + num6 + num7 + num8;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0,16.0, 8.0, 0.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(),
                1: FlexColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children:  <TableRow>[
                TableRow(
                  children: <Widget>[
                    TextTableCell(text: 'Type Setting', t: 13.0,),
                    Insert(myController: _typeSetting)
                  ]
                ),
                TableRow(
                    children: <Widget>[
                      TextTableCell(text: 'Photography' ,t: 13.0,),
                      Insert(myController: _photography)
                    ]
                ),
                TableRow(
                    children: <Widget>[
                      TextTableCell(text: 'Color Prints A3', t: 13.0,),
                      Insert(myController: _color)
                    ]
                ),
                TableRow(
                    children: <Widget>[
                      TextTableCell(text: 'Separation(E/S/T)',t: 13.0,),
                      Insert(myController: _separation)
                    ]
                ),
                TableRow(
                    children: <Widget>[
                      TextTableCell(text: 'Design' ,t: 13.0,),
                      Insert(myController: _design)
                    ]
                ),
                TableRow(
                    children: <Widget>[
                      TextTableCell(text: 'Transportation',t: 13.0,),
                      Insert(myController: _transportation)
                    ]
                ),
              ],
            ),
            const SizedBox(height: 16.0,),

            //-------------End of Table 1-----------------------------

            const TableTopic(text: 'Plates'),
            Table(
              border: TableBorder.all(),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(1.5),
                1: FlexColumnWidth(1.0),
              },
              children: [
                TableRow(
                  children: [
                    const TextTableCell(text: 'Unit Cost',t: 13.0,),
                    Insert(myController: _unitCostController)
                  ]
                ),
                TableRow(
                    children: [
                      const TextTableCell(text: 'No. of Plates Needed',t: 13.0,),
                      Insert(myController: _plateController)
                    ]
                ),
                TableRow(
                    children: [
                      const TextTableCell(text: 'Plate Cost',t: 13.0,),
                      TableCell(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                            child: Text('$result')
                          )
                      )
                    ]
                ),
              ],
            ),
            const SizedBox(height: 16.0,),

            //-----------End of Table 2---------------------------------------

            Table(
              border: TableBorder.all(),
              columnWidths:  const <int, TableColumnWidth>{
                0:FlexColumnWidth(1.5),
                1:FlexColumnWidth(1.0)
              },
              children: [
                TableRow(
                    children: [
                      TextTableCell(text: 'Total Pre-Press Cost',t: 13.0,),
                      TableCell(
                        child: Text('$totalResult')
                      )
                    ]
                )
              ],
            ),
            const SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  onPressed: (){
                    final typeSet = _typeSetting.text;
                    box.put('Type Setting', typeSet);

                    final photo = _photography.text;
                    box.put('Photography', photo);

                    final color = _color.text;
                    box.put('Color Prints', color);

                    final separation = _separation.text;
                    box.put('Separation', separation);

                    final design = _design.text;
                    box.put('Design', design);

                    final trans = _transportation.text;
                    box.put('Transportation', trans);

                    final unitcost = _unitCostController.text;
                    box.put('Unit Cost', unitcost);

                    final plates = _plateController.text;
                    box.put('Plates', plates);

                    num1 = double.parse(box.get('Unit Cost'));
                    num2 = double.parse(box.get('Plates'));

                    num3 = double.parse(box.get('Type Setting'));
                    num4 = double.parse(box.get('Photography'));
                    num5 = double.parse(box.get('Color Prints'));
                    num6 = double.parse(box.get('Separation'));
                    num7 = double.parse(box.get('Design'));
                    num8 = double.parse(box.get('Transportation'));

                    calculateResult();
                    print(num1*num2);

                  },
                  child: const Text('Calculate'),
                  color: Colors.teal[500],
                ),
                RaisedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/press');
                  },
                  child: const Text('Continue'),
                  color: Colors.teal[500],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
