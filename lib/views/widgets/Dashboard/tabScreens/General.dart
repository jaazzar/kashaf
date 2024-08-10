import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wosul_app/controllers/userController.dart';
import 'package:wosul_app/providers/currentStore.dart';
import 'package:wosul_app/views/widgets/Dashboard/SingleValuePops.dart';
import 'package:wosul_app/views/widgets/Dashboard/filterBar.dart';
import 'package:wosul_app/views/widgets/Dashboard/midleRowData.dart';
import 'package:wosul_app/views/widgets/Dashboard/wideOneValuePops.dart';
import 'dart:ui' as ui;

class GeneralSubScreen extends ConsumerStatefulWidget {
  const GeneralSubScreen({super.key});

  @override
  ConsumerState<GeneralSubScreen> createState() => _GeneralSubScreenState();
}

class _GeneralSubScreenState extends ConsumerState<GeneralSubScreen> {
  bool isLoading = false;

  void reverseLoad() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var currentStore = ref.watch(currentStoreProvider);

    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text(ref.watch(userControllerProvider)!.address!),
              // FilterBar(reverseLoad),
              const SingleValuePops(popsValuesAndNames: [
                ["تعمل", "24516"],
                ["عدد الآلات", "24516"],
                ["تحتاج الفحص", "24516"],
                ["لا تعمل", "24516"]
              ]),
              SizedBox(height: 5),
              MiddleRowData(),
              SizedBox(height: 5),
              // Placeholder(
              //     child: SizedBox(
              //   height: 200,
              //   width: double.infinity,
              // )),
              SizedBox(height: 5),
              // WideOneValuePops()
            ],
          ),
        ),
        if (isLoading)
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color.fromARGB(200, 255, 255, 255),
          ),
        if (isLoading)
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
