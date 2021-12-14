import 'package:flutter/material.dart';
import 'package:print_management/Services/input_textcell.dart';
import 'package:print_management/Services/table_cell.dart';
import 'package:print_management/Services/table_result.dart';
import 'package:print_management/Services/table_topic.dart';
import 'package:hive/hive.dart';

class PostPress extends StatefulWidget {

  @override
  _PostPressState createState() => _PostPressState();
}

class _PostPressState extends State<PostPress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Post-Press Stage'),
          centerTitle: true,
          backgroundColor: Colors.teal[500],
        ),
        body: PostPressTable(),
    );
  }
  @override
  void dispose(){
    Hive.box('post_press').close();
    super.dispose();
  }
}

class PostPressTable extends StatefulWidget {

  @override
  State<PostPressTable> createState() => _PostPressTableState();
}

class _PostPressTableState extends State<PostPressTable> {

  String lamValue = 'Gloss';
  String binValue = 'Spiral';
  List lamiList = ['Gloss', 'Matt'];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TableTopic(text: 'Laminating'),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    const  TextTableCell(text:'Laminating type', t: 13.0),
                    // TableCell(
                    //   child: Container(
                    //     child: Center(
                    //       child: DropdownButton<String>(
                    //         value: lamValue,
                    //         icon: const Icon(Icons.arrow_drop_down),
                    //         iconSize: 24,
                    //         elevation: 16,
                    //         underline: Container(
                    //           height: 2,
                    //           color: Colors.grey[700],
                    //         ),
                    //         onChanged: (String? newValue) {
                    //           setState(() {
                    //             lamValue = newValue!;
                    //           });
                    //         },
                    //         items: <String>['Gloss','Matt']
                    //             .map<DropdownMenuItem<String>>((String value) {
                    //           return DropdownMenuItem<String>(
                    //             value: value,
                    //             child: Text(value),
                    //           );
                    //         }).toList(),
                    //         onTap: (){
                    //
                    //         },
                    //       ),
                    //     ),
                    //   )
                    // )
                    //const TextTableCell(text: 'Matt', t: 13.0)
                  ]

                ),
                 TableRow(
                    children: [
                      TextTableCell(text: 'Unit Cost', t: 13.0),
                    ]
                ),
                TableRow(
                    children: [
                      TextTableCell(text: 'No. of pages', t: 13.0),
                    ]
                )
              ],
            ),
            const SizedBox(height: 3.0,),
            const TableResult(text: 'Laminating Cost', f0: 1.0, f1: 1.0),
            const SizedBox(height: 16.0,),

            //-------------End of Laminating Table-----------------------

            const TableTopic(text: 'Binding'),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    const TextTableCell(text: 'Binding Type', t: 13.0),
        //             TableCell(
        //               child: Container(
        //                 child: Center(
        //                   child: DropdownButton<String>(
        //                     value: binValue,
        //                     icon: const Icon(Icons.arrow_drop_down),
        //                     iconSize: 24,
        //                     elevation: 16,
        //                     underline: Container(
        //                       height: 2,
        //                       color: Colors.grey[700],
        //                   ),
        //                   onChanged: (String? newValue) {
        //                     setState(() {
        //                       binValue = newValue!;
        //                     });
        //                   },
        //                   items: <String>['Spiral', 'Hooks', 'Rimming', 'Eyelts', 'Perfect binding', 'Hardcover Binding']
        //                         .map<DropdownMenuItem<String>>((String value) {
        //                           return DropdownMenuItem<String>(
        //                             value: value,
        //                             child: Text(value),
        //                           );
        //                   }).toList(),
        //                   onTap: (){
        //
        //                   },
        //                 )
        //     )
        //   )
        // )
                  ]
                ),
                 TableRow(
                    children: [
                      TextTableCell(text: 'Unit Cost', t: 13.0),
                    ]
                ),
                 TableRow(
                    children: [
                      TextTableCell(text: 'No. of Qty', t: 13.0),
                    ]
                ),
              ],
            ),
            const SizedBox(height: 3.0,),
            const TableResult(text: 'Binding Cost', f0: 1.0, f1: 1.0),

            const SizedBox(height: 16.0,),

            //----------------End of Binding Table---------------------

            const TableTopic(text:'Miscellaneous'),
            Table(
              border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(0.5),
                1: FlexColumnWidth(1.0),
                //2: FlexColumnWidth(1.0)
              },
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Container(),
                    ),
                    const TextTableCell(text: 'Item', t: 13.0),
                    //const TextTableCell(text: 'Cost', t: 13.0)
                  ]
                ),
                TableRow(
                  children: [
                    TextTableCell(text: '1', t: 13.0),
                    InputTextCell(),
                  ]
                ),
                TableRow(
                    children: [
                      TextTableCell(text: '2', t: 13.0),
                      InputTextCell(),
                    ]
                ),
                TableRow(
                    children: [
                      TextTableCell(text: '3', t: 13.0),
                      InputTextCell(),
                    ]
                ),
                TableRow(
                    children: [
                      TextTableCell(text: '4', t: 13.0),
                      InputTextCell(),
                    ]
                )
              ],
            ),
            const SizedBox(height: 3.0,),
            const TableResult(text: 'Miscellaneous Costs', f0: 1.2, f1: 1.0),
            const SizedBox(height: 16.0,),

            //----------End of Miscellaneous Table------------------------
            
            TableTopic(text: 'Folding'),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    TextTableCell(text: 'Cost for folding', t: 13.0),
                  ]
                ),
                TableRow(
                    children: [
                      TextTableCell(text: 'No of Folding', t: 13.0),
                    ]
                )
              ],
            ),
            const SizedBox(height: 3.0,),
            const TableResult(text: 'Folding Cost', f0: 1.0, f1: 1.0),
            const SizedBox(height: 16.0,),

            //--------------End of Folding Table-----------------------
            
            const TableTopic(text: 'Gathering'),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    TextTableCell(text: 'Cost per Sheet', t: 13.0),
                  ]
                ),
                TableRow(
                    children: [
                      TextTableCell(text: 'No. of sheets', t: 13.0),
                    ]
                )
              ],
            ),
            const SizedBox(height: 3.0,),
            const TableResult(text: 'Gathering Cost', f0: 1.0, f1: 1.0),
            const SizedBox(height: 16.0,),

            //-----------------End of Gathering Table-----------------

            const TableTopic(text: 'Finishing'),
            // Finishing Table
            const SizedBox(height: 16.0,),

            //-----------------End of Finishing Table-----------------

            const TableTopic(text: 'Guilotine Cutting'),
            Table(
              border: TableBorder.all(),
              children:  [
                TableRow(
                    children: [
                      TextTableCell(text: 'Cost per unit', t: 13.0),
                    ]
                ),
                TableRow(
                    children: [
                      TextTableCell(text: 'No. of cuts', t: 13.0),
                    ]
                )
              ],
            ),
            const SizedBox(height: 3.0,),
            const TableResult(text: 'Guilotine Cutting Cost', f0: 1.5, f1: 1.0),
            const SizedBox(height: 16.0,),

            //-----------End of Guilotine cutting Table-----------

            const TableTopic(text: 'Die Cutting'),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                    children: [
                      TextTableCell(text: 'Cost per unit', t: 13.0),
                    ]
                ),
                TableRow(
                    children: [
                      TextTableCell(text: 'No. of cuts', t: 13.0),
                    ]
                )
              ],
            ),
            const SizedBox(height: 3.0,),
            const TableResult(text: 'Die Cutting Cost', f0: 1.5, f1: 1.0),
            const SizedBox(height: 16.0,),

            //------------End of Die Cutting Table--------------------

            const TableTopic(text: 'Packing'),
            // Packing Table
            const SizedBox(height: 16.0,),

            //----------------End of Packing Table---------------------

            const TableTopic(text: 'Transport'),
            // Transport Table
            const SizedBox(height: 16.0,),

            //----------------End of Transport Table--------------------

            const TableTopic(text: 'Extra for urgent job'),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                    children: [
                      TextTableCell(text: 'Binding', t: 13.0),
                    ]
                ),
                TableRow(
                    children: [
                      TextTableCell(text: 'OT', t: 13.0),
                    ]
                ),
                TableRow(
                    children: [
                      TextTableCell(text: 'Other', t: 13.0),
                    ]
                )
              ],
            ),
            const SizedBox(height: 3.0,),
            const TableResult(text: 'Guilotine Cutting Cost', f0: 1.5, f1: 1.0),
            const SizedBox(height: 16.0,),

            //-----------End of Extra Cost Table---------------------


          ],
        ),
      ),
    );
  }
}

