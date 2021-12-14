import 'package:flutter/material.dart';
import 'package:print_management/Services/input_cell.dart';
import 'package:print_management/Services/table_cell.dart';
import 'package:print_management/Services/table_result.dart';
import 'package:hive/hive.dart';

class Press extends StatefulWidget {

  @override
  _PressState createState() => _PressState();
}

class _PressState extends State<Press> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Press Stage'),
        centerTitle: true,
        backgroundColor: Colors.teal[500],
      ),
      body: const PressTable(),
    );
  }

  @override
  void dispose(){
    Hive.box('press').close();
    super.dispose();
  }
}

class PressTable extends StatelessWidget {
  const PressTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(1.5),
                1: FlexColumnWidth(1.0),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(
                  children: [
                    TextTableCell(text: 'Cost per impression',t: 13.0,),
                    //InputCell(),
                  ]
                ),
                TableRow(
                    children: [
                      TextTableCell(text: 'No. of impression',t: 13.0,),
                      //InputCell(),
                    ]
                ),
                TableRow(
                    children: [
                      const TextTableCell(text: 'Impression Cost',t: 13.0,),
                      TableCell(
                        child: Container(
                          height: 50.0,
                          color: Colors.grey,
                        ),
                      ),
                    ]
                )
              ],
            ),
            const SizedBox(height: 16.0,),

            //------------End of Table 1--------------------------------

            Table(
              border: TableBorder.all(),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    TextTableCell(text: 'Ink Cost',t: 13.0,),
                    //InputCell()
                  ]
                ),
                TableRow(
                    children: [
                      TextTableCell(text: 'Plate Settings',t: 13.0,),
                      //InputCell()
                    ]
                ),
                TableRow(
                    children: [
                      TextTableCell(text: 'Profiting One side',t: 13.0,),
                      //InputCell()
                    ]
                )
              ],
            ),
            const SizedBox(height: 16.0,),

            //---------End of Table 2---------------------------

            const SizedBox(height: 8.0,),
            TableResult(text: 'Total Press Cost', f0: 1.0, f1: 1.0),
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
                    Navigator.pushNamed(context, '/post_press');
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

