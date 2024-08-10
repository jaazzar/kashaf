import 'package:flutter/material.dart';
import 'package:wosul_app/views/widgets/Dashboard/wideOneNumberInfo.dart';

class WideOneValuePops extends StatelessWidget {
  const WideOneValuePops({super.key});

  @override
  Widget build(context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WideOneNumberInfo(
            name: "Top Products by Net Sales (INR)",
            value: 24516,
            rising: true,
            isBlue: true),
        WideOneNumberInfo(
            name: "Top Payments (INR)",
            value: 24516,
            rising: true,
            isBlue: false),
        WideOneNumberInfo(
            name: "Top Branches by Net Sales (INR)",
            value: 24516,
            rising: true,
            isBlue: true),
      ],
    );
  }
}
