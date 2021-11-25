import 'package:flutter/material.dart';

class InputTextCell extends StatelessWidget {
  const InputTextCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          child: TextField(
            cursorColor: Colors.teal[500],
            //obscureText: true,

          ),
        ),
      ),
    );
  }
}