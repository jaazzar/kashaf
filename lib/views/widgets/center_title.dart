import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CenterTitle extends StatelessWidget {
  Text title;
   CenterTitle({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return   Align(
      alignment: Alignment.center,
      child: Text(
        title.data.toString(),
        style: TextStyle(
          fontSize: 37,
          fontWeight: FontWeight.w700,
          color: hexToColor('#1E40AF'),
        ),
      ),
    );
  }
}
Color hexToColor(String hexString) {
  return Color(int.parse(hexString.substring(1, 7), radix: 16) + 0xFF000000);
}