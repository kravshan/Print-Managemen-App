import 'package:flutter/material.dart';

class TableTopic extends StatelessWidget {
  final String text;

  const TableTopic({required this.text});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(
            children: [
              TableCell(
                  child: Container(
                    height: 32.0,
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 3.0, 0.0, 0.0),
                      child: Text(
                        text,
                        style: const TextStyle(
                            fontSize: 20.0
                        ),
                      ),
                    ),

                  )
              ),
            ]
        )
      ],
    );
  }
}
