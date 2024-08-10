import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:wosul_app/views/widgets/Dashboard/SingleValuePops.dart';
import 'package:wosul_app/views/widgets/Dashboard/brancheStatistics.dart';
import 'package:wosul_app/views/widgets/Dashboard/oneNumberInfo.dart';

class BranchesTab extends StatefulWidget {
  const BranchesTab({super.key});

  @override
  State<BranchesTab> createState() => _BranchesTabState();
}

class _BranchesTabState extends State<BranchesTab> {
  bool anim = false;
  void fix() {
    setState(() {
      anim = true;
      // fix = true;
      //  showArrow = false;
      // Anything else you want
    });
    Future.delayed(Duration(seconds: 1, milliseconds: 500)).then((_) {
      setState(() {
        anim = false;
        //  showArrow = true; //goes back to arrow Icon
        // Anything else you want
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       CircleAvatar(
            //         backgroundColor: Color(0xffE4E9F9),
            //         child: IconButton(
            //           onPressed: () {},
            //           icon: const Icon(Icons.filter_alt,
            //               color: Color(0xff1E40AF), size: 20),
            //         ),
            //       ),
            //       const Text(
            //         "الآلات",
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black54,
            //             fontSize: 25),
            //       ),
            //     ],
            //   ),
            // ),
            // const SingleValuePops(
            //   popsValuesAndNames: [
            //     ["Orders Count", "0"],
            //     ["Orders Amount", "(INR 0)"],
            //     ["Occupied Tables", "0"],
            //     ["Offline Cashiers", "0"]
            //   ],
            // ),
            const SizedBox(height: 18),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                "احصائيات و سجل الآلات",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 25),
              ),
            ),
            SizedBox(
              height: 280,
              child: ShaderMask(
                shaderCallback: (Rect rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.white
                    ],
                    stops: [
                      0.0,
                      0.1,
                      0.9,
                      1.0
                    ], // 10% purple, 80% transparent, 10% purple
                  ).createShader(rect);
                },
                blendMode: BlendMode.dstOut,
                child: ListView(
                  children: [
                    BrancheStatistics(
                        state: stat.perfect,
                        name: 'Robot Arm',
                        temp: 54,
                        fixed: fix,
                        regularMoveMentPercent: 87),
                    BrancheStatistics(
                        state: stat.nWorking,
                        name: 'Conveyor ',
                        temp: 54,
                        fixed: fix,
                        regularMoveMentPercent: 87),
                    BrancheStatistics(
                        state: stat.needsR,
                        name: 'Cutters',
                        temp: 54,
                        fixed: fix,
                        regularMoveMentPercent: 87),
                    BrancheStatistics(
                        state: stat.perfect,
                        name: 'Packaging Machine',
                        fixed: fix,
                        temp: 54,
                        regularMoveMentPercent: 87),
                    BrancheStatistics(
                        state: stat.perfect,
                        name: 'Robot Arm',
                        temp: 54,
                        fixed: fix,
                        regularMoveMentPercent: 87),
                    BrancheStatistics(
                        state: stat.nWorking,
                        name: 'Conveyor ',
                        temp: 54,
                        fixed: fix,
                        regularMoveMentPercent: 87),
                    BrancheStatistics(
                        state: stat.needsR,
                        name: 'Cutters',
                        temp: 54,
                        fixed: fix,
                        regularMoveMentPercent: 87),
                    BrancheStatistics(
                        state: stat.perfect,
                        name: 'Packaging Machine',
                        fixed: fix,
                        temp: 54,
                        regularMoveMentPercent: 87),
                    // BrancheStatistics(),
                    // BrancheStatistics(),
                    // BrancheStatistics(),
                    // BrancheStatistics(),
                    // BrancheStatistics(),
                    // BrancheStatistics(),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
            // Container(
            //   height: 100,
            //   width: 100,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            // ),
            // ColorFiltered(
            //     colorFilter: ColorFilter.mode(
            //       Colors.white,
            //       BlendMode.modulate,
            //     ),
            //     child: Lottie.asset('assets/check.json')),
            // Row(
            //   children: [
            //     Container(
            //       height: 100,
            //       width: 100,
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //     ),
            //     Container(
            //       height: 100,
            //       width: 100,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //     )
            //   ],
            // ),
            Row(
              children: [
                // Text("data"),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  height: 200,
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "عندك آلة جديدة ؟",
                        style: TextStyle(fontSize: 23),
                      ),
                      Gap(10),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("اضافة آلة"),
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            // padding: EdgeInsets.symmetric(horizontal: ),
                            backgroundColor: Colors.blue[100]),
                      )
                    ],
                  ),
                ), // Text("data"),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  height: 200,
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "خلل غير ظاهر؟",
                        style: TextStyle(fontSize: 23),
                      ),
                      Gap(10),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("تبليغ"),
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            // padding: EdgeInsets.symmetric(horizontal: ),
                            backgroundColor: Colors.red[100]),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        if (anim)
          BackdropFilter(
            // Blurs the background
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Center(
              child: Lottie.asset('assets/check.json'),
            ),
          )
      ],
    );
  }
}
