import 'package:flutter/material.dart';
import 'package:wosul_app/views/widgets/Dashboard/OneNumberInfo.dart';

class SingleValuePops extends StatelessWidget {
  const SingleValuePops({super.key, required this.popsValuesAndNames});
  final List<List> popsValuesAndNames;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OneNumberInfo(
                name: popsValuesAndNames[0][0],
                value: popsValuesAndNames[0][1],
                rising: true,
                linesPictureNumber: 1),
            OneNumberInfo(
                name: popsValuesAndNames[1][0],
                value: popsValuesAndNames[1][1],
                rising: true,
                linesPictureNumber: 2),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OneNumberInfo(
                name: popsValuesAndNames[2][0],
                value: popsValuesAndNames[2][1],
                rising: false,
                linesPictureNumber: 3),
            OneNumberInfo(
                name: popsValuesAndNames[3][0],
                value: popsValuesAndNames[3][1],
                rising: true,
                linesPictureNumber: 4),
          ],
        ),
      ],
    );
  }
}
