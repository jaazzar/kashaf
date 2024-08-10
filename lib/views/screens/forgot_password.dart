import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wosul_app/views/widgets/center_description.dart';
import 'package:wosul_app/views/widgets/center_title.dart';
import 'package:wosul_app/views/widgets/input_field_with_label.dart';
import 'package:wosul_app/views/widgets/top_logo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wosul_app/controllers/userController.dart';

class ForgotPassword extends ConsumerStatefulWidget {
  ForgotPassword({super.key});

  @override
  ConsumerState<ForgotPassword> createState() => _ForgotPasswordState();
}

// ignore: non_constant_identifier_names
TextEditingController emailController = TextEditingController();

var _rememberMe = false;
var _showPassword = false;

class _ForgotPasswordState extends ConsumerState<ForgotPassword> {
  var errorText = null;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.maxFinite,
          decoration: _backgroundImage(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TopLogo(),
              CenterTitle(title: Text('Forgot Password')),
              CenterDiscription1(
                  title:
                      Text('We will send you a link to reset your password')),
              SizedBox(height: size.height * 0.2),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 0), // changes position of shadow
                          ),
                        ]),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 20, right: 20),
                          child: InpuFieldWithLabel(
                            controller: emailController,
                            label: Text('Email Address '),
                            hint: Text('example@gmail.com'),
                            errorText: errorText,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: SizedBox(
                            height: 50,
                            width: size.width * 0.8,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(30, 64, 175, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: () async {
                                var status = await ref
                                    .read(userControllerProvider.notifier)
                                    .forgotPassword(emailController.text);
                                if (status) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('Email sent successfully'),
                                    backgroundColor: Colors.black,
                                  ));
                                  emailController.clear();
                                  Navigator.pop(context);
                                } else {
                                  setState(() {
                                    errorText = 'Email not found';
                                  });
                                  emailController.clear();
                                }
                              },
                              child: const Text(
                                'Send OTP',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Center(
                  child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Already have an account? Sign In',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w900),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _backgroundImage() {
    return const BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/images/Subtract.png"),
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter),
    );
  }
}

Color hexToColor(String hexString) {
  return Color(int.parse(hexString.substring(1, 7), radix: 16) + 0xFF000000);
}

bool emailValidator(String email) {
  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  return emailValid;
}
