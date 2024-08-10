import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:wosul_app/views/widgets/Dashboard/chart.dart';

enum stat {
  perfect,
  needsR,
  nWorking,
}

class BrancheStatistics extends StatefulWidget {
  BrancheStatistics(
      {super.key,
      required this.name,
      required this.temp,
      required this.regularMoveMentPercent,
      required this.state,
      required this.fixed});

  final String name;
  final int temp;
  final int regularMoveMentPercent;
  final stat state;
  final VoidCallback fixed;

  @override
  State<BrancheStatistics> createState() => _BrancheStatisticsState();
}

class _BrancheStatisticsState extends State<BrancheStatistics> {
  bool open = false;
  bool anim = false;
  bool fix = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              open = !open;
            });
          },
          child: Container(
              alignment: (open) ? Alignment.bottomLeft : Alignment.centerLeft,
              padding: EdgeInsets.only(
                left: 15,
                bottom: (open) ? 20 : 0,
              ),
              height: (open) ? 140 : 60,
              margin:
                  const EdgeInsets.only(top: 3, bottom: 3, left: 15, right: 15),
              decoration: BoxDecoration(
                color: const Color(0xffE4E9F9),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                (open)
                    ? Icons.arrow_upward_rounded
                    : Icons.arrow_downward_rounded,
                color: const Color(0xff1E40AF),
              )),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, top: 10, bottom: 7, right: 30),
            margin:
                const EdgeInsets.only(top: 3, bottom: 3, right: 15, left: 30),
            width: screenSize.width - 80,
            height: (open) ? 140 : 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        // width: 70,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        height: 30,
                        decoration: BoxDecoration(
                            color: (widget.state == stat.perfect)
                                ? const Color.fromARGB(96, 85, 255, 136)
                                : ((widget.state == stat.nWorking)
                                    ? Color.fromARGB(95, 255, 238, 85)
                                    : Color.fromARGB(95, 255, 85, 85)),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text((widget.state == stat.perfect)
                            ? "سليمة"
                            : ((widget.state == stat.nWorking)
                                ? "تتطلب الفحص"
                                : "لا تعمل"))),
                    Gap(20),
                    FittedBox(
                      child: AutoSizeText(
                        widget.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xff27364D)),
                      ),
                    ),
                    const FittedBox(
                      child: AutoSizeText(
                        " :اسم الآلة",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xff27364D)),
                      ),
                    ),
                  ],
                ),
                if (open) const Gap(10),
                if (open)
                  FittedBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AutoSizeText("${widget.temp}: درجة الحرارة",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54)),
                        const SizedBox(
                          width: 20,
                        ),
                        AutoSizeText(
                            "${widget.regularMoveMentPercent} % : طبيعية الحركة",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54)),
                      ],
                    ),
                  ),
                Gap(5),
                if (open)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(7, 5, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                // Flutter method for showing popups
                                context: context,
                                builder: (context) => Popup(
                                    LineChartSample2()), // "Hello!" is the string that will show when we press the button
                              );
                            },
                            child: Text("رسم بياني"),
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                padding: EdgeInsets.all(2),
                                backgroundColor: Colors.blue[100]),
                          ),
                        ),
                        // InkWell(
                        //   onTap: () {},
                        //   child: Container(
                        //     // width: 70,
                        //     padding: EdgeInsets.symmetric(horizontal: 10),
                        //     alignment: Alignment.center,
                        //     height: 30,
                        //     decoration: BoxDecoration(
                        //       color: Colors.blue[100],
                        //       borderRadius: BorderRadius.circular(20),
                        //     ),
                        //     child: Text("الرسم البياني"),
                        //   ),
                        // ),
                        if (widget.state != stat.perfect) Gap(10),
                        if (widget.state != stat.perfect)
                          Expanded(
                            child: ElevatedButton(
                              onPressed: fix
                                  ? null
                                  : () {
                                      setState(() {
                                        fix = true;
                                      });
                                      widget.fixed();
                                    },
                              child: (anim)
                                  ? SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Lottie.asset('assets/check.json'))
                                  : Text("اصلاح"),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  padding: EdgeInsets.all(2),
                                  backgroundColor:
                                      Color.fromARGB(255, 251, 187, 187)),
                            ),
                          ),
                      ],
                    ),
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Popup extends StatelessWidget {
  // Parameter is message and this creates a popup with a blurred out background
  Popup(
    this.body, {
    // Parameter for the message we want
    Key? key,
  }) : super(key: key);
  Widget body;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      // Blurs the background
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: Container(
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(13),
          ),
          alignment: Alignment.center,
          // height: 300,
          // width: 100,
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
              ),
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 30,
                      )),
                  body,
                ],
              ))),
    );
  }
}
