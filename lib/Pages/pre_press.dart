import 'package:flutter/material.dart';
import 'package:print_management/Services/table_cell.dart';
import 'package:print_management/Services/input_cell.dart';
import 'package:print_management/Services/table_result.dart';
import 'package:print_management/Services/table_topic.dart';

class PrePress extends StatefulWidget {
  const PrePress({Key? key}) : super(key: key);

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
      body: const PrePressTable(),
    );
  }
}

class PrePressTable extends StatelessWidget {
  const PrePressTable({Key? key}) : super(key: key);

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
              children: const <TableRow>[
                TableRow(
                  children: <Widget>[
                    TextTableCell(text: 'Type Setting', t: 13.0,),
                    InputCell(),
                  ]
                ),
                TableRow(
                    children: <Widget>[
                      TextTableCell(text: 'Photography' ,t: 13.0,),
                      InputCell(),
                    ]
                ),
                TableRow(
                    children: <Widget>[
                      TextTableCell(text: 'Color Prints A3', t: 13.0,),
                      InputCell(),
                    ]
                ),
                TableRow(
                    children: <Widget>[
                      TextTableCell(text: 'Separation(E/S/T)',t: 13.0,),
                      InputCell(),
                    ]
                ),
                TableRow(
                    children: <Widget>[
                      TextTableCell(text: 'Design' ,t: 13.0,),
                      InputCell(),
                    ]
                ),
                TableRow(
                    children: <Widget>[
                      TextTableCell(text: 'Transportation',t: 13.0,),
                      InputCell(),
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
              children: const [
                TableRow(
                  children: [
                    TextTableCell(text: 'Unit Cost',t: 13.0,),
                    InputCell(),
                  ]
                ),
                TableRow(
                    children: [
                      TextTableCell(text: 'No. of Plates Needed',t: 13.0,),
                      InputCell()
                    ]
                ),
                TableRow(
                    children: [
                      TextTableCell(text: 'Plate Cost',t: 13.0,),
                      InputCell()
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
