import 'package:flutter/material.dart';

class TextTableCell extends StatelessWidget {

  final String text;
  final double t;

  const TextTableCell({required this.text, required this.t});

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Container(
      height: 50,
      child: Padding(
        padding: EdgeInsets.fromLTRB(5.0, t, 0.0, 0.0),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20.0
          ),
        ),
      ),
    ),
    );
  }
}
