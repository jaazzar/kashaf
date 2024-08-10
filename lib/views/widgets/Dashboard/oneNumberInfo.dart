import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class OneNumberInfo extends StatelessWidget {
  final String name;
  final String value;
  final bool rising;
  final int linesPictureNumber;

  const OneNumberInfo(
      {super.key,
      required this.name,
      required this.value,
      required this.rising,
      required this.linesPictureNumber});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 75,
      width: size.width / 2.2,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
              image: AssetImage("assets/images/lines$linesPictureNumber.png")),
          SizedBox(
            // width: 90,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AutoSizeText(
                  name,
                  overflow: TextOverflow.visible,
                  minFontSize: 2,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black54),
                  maxLines: 2,
                ),
                Row(
                  children: [
                    // Image(
                    //     image: AssetImage(
                    //         "assets/images/${rising ? "arrowUp.png" : "arrowDown.png"}")),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      value.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
