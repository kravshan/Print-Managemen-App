import 'package:flutter/material.dart';
import 'package:print_management/Services/backgound.dart';
import 'package:print_management/Services/logo_bar.dart';

class EnterDetails extends StatelessWidget {
  const EnterDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: const [
          Background(),
          LogoBar(),

        ],
      ),
    );
  }
}
