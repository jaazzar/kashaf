import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 200,
          backgroundColor: const Color.fromARGB(6, 0, 0, 0),
          child: CircleAvatar(
            radius: 150,
            backgroundColor: const Color.fromARGB(5, 0, 0, 0),
            child: CircleAvatar(
              radius: 100,
              backgroundColor: const Color.fromARGB(4, 0, 0, 0),
              child: Image(
                height: MediaQuery.of(context).size.width / 3,
                image: const AssetImage("assets/images/SplashScreenLogo.png"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
