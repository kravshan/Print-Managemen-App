import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class InputCell extends StatefulWidget {

  @override
  State<InputCell> createState() => _InputCellState();
}

class _InputCellState extends State<InputCell> {

  late double value;

  TextEditingController _nameCrontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
        child: TextField(
          controller: _nameCrontroller,
          cursorColor: Colors.teal[500],
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          onEditingComplete: (){
            value = _nameCrontroller.value as double;
            getController();
          },
        ),
      ),
    );
  }

  double getController(){
    return value;
  }
}
