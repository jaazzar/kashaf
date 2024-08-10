import 'package:flutter/material.dart';

class TopLogo extends StatelessWidget {
  const TopLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topRight, // Aligns the image to the top right corner
      child: Image(
        image: AssetImage('assets/images/topRightCornerLogo.png'),
      ),
    );
  }
}
