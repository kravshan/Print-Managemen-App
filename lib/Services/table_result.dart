import 'package:flutter/material.dart';
import 'package:print_management/Services/table_cell.dart';

class TableResult extends StatelessWidget {
  final String text;
  final double f0;
  final double f1;

  const TableResult({required this.text, required this.f0, required this.f1});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths:  <int, TableColumnWidth>{
        0:FlexColumnWidth(f0),
        1:FlexColumnWidth(f1)
      },
      children: [
        TableRow(
            children: [
              TextTableCell(text: text,t: 13.0,),
              TableCell(
                child: Container(
                  height: 50.0,
                  color: Colors.tealAccent,
                ),
              )
            ]
        )
      ],
    );
  }
}
