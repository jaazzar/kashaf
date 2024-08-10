import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CenterDiscription1 extends StatelessWidget {
  Text title;

   CenterDiscription1({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
     return Align(
      alignment: Alignment.center,
      child: Text(
        title.data.toString(),
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: hexToColor('#596E80'),
        ),
      ));
  }
}
Color hexToColor(String hexString) {
  return Color(int.parse(hexString.substring(1, 7), radix: 16) + 0xFF000000);
}