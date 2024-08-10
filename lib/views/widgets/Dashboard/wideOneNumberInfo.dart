import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class WideOneNumberInfo extends StatelessWidget {
  const WideOneNumberInfo(
      {super.key,
      required this.name,
      required this.value,
      required this.rising,
      required this.isBlue});

  final String name;
  final int value;
  final bool rising;
  final bool isBlue;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 135,
      width: size.width / 3.5,
      // padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 90,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 40,
                    child: AutoSizeText(
                      name,
                      maxLines: 2,
                      minFontSize: 5,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        value.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image(
                          image: AssetImage(
                              "assets/images/${rising ? "arrowUp.png" : "arrowDown.png"}"))
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(
                        "assets/images/${isBlue ? "BottomBluePopDesign.png" : "BottomPinkPopDesign.png"}")),
              ),
            ),
          )
        ],
      ),
    );
  }
}
