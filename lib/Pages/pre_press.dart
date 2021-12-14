import 'package:flutter/material.dart';
import 'package:print_management/Services/table_cell.dart';
import 'package:print_management/Services/input_cell.dart';
import 'package:print_management/Services/table_result.dart';
import 'package:print_management/Services/table_topic.dart';
import 'package:hive/hive.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

class PrePressTable extends StatelessWidget {

  var box = Hive.box<dynamic>('pre_press');

  late String val;
  final TextEditingController _unitCostController = TextEditingController();
  final TextEditingController _plateController = TextEditingController();
  final TextEditingController _plateCostController = TextEditingController();

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
                    //InputCell(),
                  ]
                ),
                TableRow(
                    children: <Widget>[
                      TextTableCell(text: 'Photography' ,t: 13.0,),
                      //InputCell(),
                    ]
                ),
                TableRow(
                    children: <Widget>[
                      TextTableCell(text: 'Color Prints A3', t: 13.0,),
                      //InputCell(),
                    ]
                ),
                TableRow(
                    children: <Widget>[
                      TextTableCell(text: 'Separation(E/S/T)',t: 13.0,),
                      //InputCell(),
                    ]
                ),
                TableRow(
                    children: <Widget>[
                      TextTableCell(text: 'Design' ,t: 13.0,),
                      //InputCell(),
                    ]
                ),
                TableRow(
                    children: <Widget>[
                      TextTableCell(text: 'Transportation',t: 13.0,),
                      //InputCell(),
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
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: TextField(
                          controller: _unitCostController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    )
                  ]
                ),
                TableRow(
                    children: [
                      const TextTableCell(text: 'No. of Plates Needed',t: 13.0,),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                            child: TextField(
                                controller: _plateController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                )
                        )
                      )
                      )
                    ]
                ),
                TableRow(
                    children: [
                      const TextTableCell(text: 'Plate Cost',t: 13.0,),
                      TableCell(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                            child: Text('')
                          )
                      )
                    ]
                ),
              ],
            ),
            const SizedBox(height: 16.0,),

            //-----------End of Table 2---------------------------------------

            const TableResult(text: 'Total Pre-press Cost', f0: 1.5, f1: 1.0),
            const SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  onPressed: (){
                   final unitcost = _unitCostController.text;
                   box.put('Unit Cost', unitcost);

                   final plates = _plateController.text;
                   box.put('Plates', plates);


                   // final platecost = _plateCostCrontroller.value;
                   // try{
                   //   box.put('Plate Cost', platecost);
                   // }catch(e){
                   //   print(e);
                   // }


                    //final a = Hive.box('pre_press').get('Unit Cost');
                    //final b = Hive.box('pre_press').get(platesid);
                    //final c = Hive.box('pre_press').get(platecostid);

                   var num1 = double.parse(box.get('Unit Cost'));
                   var num2 = double.parse(box.get('Plates'));
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
