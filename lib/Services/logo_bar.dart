import 'package:flutter/material.dart';

class LogoBar extends StatelessWidget {
  const LogoBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white.withOpacity(0.3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Padding(
              padding: EdgeInsets.all(40.0),
              child: Image(image: AssetImage('assets/Dw.png'))
          )
        ],
      ),);
  }
}
