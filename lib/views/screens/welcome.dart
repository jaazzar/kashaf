import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wosul_app/views/screens/login_screen.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity, // added
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Image(
                    fit: BoxFit.contain,
                    width: screenSize.width * .8,
                    image: const AssetImage("assets/images/kashaf.png")),
              ),
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    const Image(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/Subtract.png"),
                    ),
                    Positioned(
                      bottom: 28,
                      left: 28,
                      right: 28,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // padding: EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            height: screenSize.height / 15,
                            // width: screenSize.width / 1.5,
                            child: const AutoSizeText(
                              "مرحبا بك في كشاف",
                              maxLines: 1,
                              // overflow: TextOverflow.visible,
                              style: TextStyle(
                                  fontSize: 400,
                                  // fontSize: (screenSize.height > 700)
                                  //     ? 30
                                  //     : 25, // 30 on your device
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          // SizedBox(height: (screenSize.height > 700) ? 20 : 15),
                          Container(
                            alignment: Alignment.center,
                            height: screenSize.height / 13,
                            width: screenSize.width / 1,
                            child: const Text(
                              "نضيء طريق الكفاءة والموثوقية",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.visible,
                              // minFontSize: 8,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(height: (screenSize.height > 700) ? 25 : 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(double.maxFinite, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: AutoSizeText(
                              "ابدأ",
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: screenSize.height / 40),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// if the width of the screen is too big


            // Expanded(
            //   child: Stack(
            //     fit: StackFit.expand,
            //     children: [
            //       const Image(
            //         fit: BoxFit.fill,
            //         image: AssetImage("assets/images/Subtract.png"),
            //       ),
            //       Positioned(
            //         bottom: 28,
            //         left: 28,
            //         right: 28,
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text(
            //               "Welcome to Wosul",
            //               style: TextStyle(
            //                   fontSize: (screenSize.height > 700)
            //                       ? 30
            //                       : 25, // 30 on your device
            //                   fontWeight: FontWeight.w600,
            //                   color: Colors.white),
            //             ),