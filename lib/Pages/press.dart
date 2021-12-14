import 'package:flutter/material.dart';
import 'package:print_management/Services/table_cell.dart';
import 'package:print_management/Services/table_result.dart';
import 'package:hive/hive.dart';
import 'package:print_management/Services/insert.dart';

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

class PressTable extends StatefulWidget {
  const PressTable({Key? key}) : super(key: key);

  @override
  State<PressTable> createState() => _PressTableState();
}

class _PressTableState extends State<PressTable> {

  var boxPress = Hive.box('press');
  late double num1;
  late double num2;
  late double num3;
  late double num4;
  late double num5;

  double result = 0;
  double totalResult = 0;

  void getResult(){
    setState(() {
      result = num1*num2;
      totalResult = result + num3 + num4 + num5;
    });
  }

  final TextEditingController _costImpression = TextEditingController();
  final TextEditingController _noofImpression = TextEditingController();
  final TextEditingController _inkCost = TextEditingController();
  final TextEditingController _plateSet = TextEditingController();
  final TextEditingController _profit = TextEditingController();

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
                    Insert(myController: _costImpression)
                  ]
                ),
                TableRow(
                    children: [
                      TextTableCell(text: 'No. of impression',t: 13.0,),
                      Insert(myController: _noofImpression)
                    ]
                ),
                TableRow(
                    children: [
                      const TextTableCell(text: 'Impression Cost',t: 13.0,),
                      TableCell(
                        child: Text('$result')
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
                    Insert(myController: _inkCost)
                  ]
                ),
                TableRow(
                    children: [
                      TextTableCell(text: 'Plate Settings',t: 13.0,),
                      Insert(myController: _plateSet)
                    ]
                ),
                TableRow(
                    children: [
                      TextTableCell(text: 'Profiting One side',t: 13.0,),
                      Insert(myController: _profit)
                    ]
                )
              ],
            ),
            const SizedBox(height: 16.0,),

            //---------End of Table 2---------------------------

            const SizedBox(height: 8.0,),
            Table(
              border: TableBorder.all(),
              columnWidths:  <int, TableColumnWidth>{
                0:FlexColumnWidth(1.0),
                1:FlexColumnWidth(1.0)
              },
              children: [
                TableRow(
                    children: [
                      TextTableCell(text: 'Total Press Cost',t: 13.0,),
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
                    final costImpress = _costImpression.text;
                    boxPress.put('Cost per Impression', costImpress);

                    final impress = _noofImpression.text;
                    boxPress.put('No of Impression', impress);

                    final inkCost = _inkCost.text;
                    boxPress.put('Ink Cost', inkCost);

                    final plateSet = _plateSet.text;
                    boxPress.put('Plate Setting', plateSet);

                    final profit = _profit.text;
                    boxPress.put('Profit', profit);

                    num1 = double.parse(boxPress.get('Cost per Impression'));
                    num2 = double.parse(boxPress.get('No of Impression'));

                    num3 = double.parse(boxPress.get('Ink Cost'));
                    num4 = double.parse(boxPress.get('Plate Setting'));
                    num5 = double.parse(boxPress.get('Profit'));

                    getResult();

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

