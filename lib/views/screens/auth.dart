// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image(
            image: AssetImage("assets/images/Subtract.png"),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Image(
            image: AssetImage("assets/images/kashaf.png"),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "Sign in",
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome back, you have been missed",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                height: 375,
                width: 375,
                child: Card(
                  surfaceTintColor: Colors.white,
                  elevation: 20,
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
