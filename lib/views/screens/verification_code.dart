import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wosul_app/views/screens/reset_password.dart';
import 'package:wosul_app/views/widgets/center_description.dart';
import 'package:wosul_app/views/widgets/center_title.dart';
import 'package:wosul_app/views/widgets/top_logo.dart';

// ignore: unused_import
import 'package:wosul_app/views/widgets/input_field_with_label.dart';

class VerficationCode extends StatefulWidget {
  VerficationCode({super.key});

  @override
  State<VerficationCode> createState() => _VerficationCodeState();
}

var _rememberMe = false;
var _showPassword = false;

class _VerficationCodeState extends State<VerficationCode> {
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
              CenterTitle(title: Text('Email Verification')),
              CenterDiscription1(
                  title: Text('Enter the code sent to your email address')),
              SizedBox(height: size.height * 0.20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: size.width * 0.92,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
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
                            padding: const EdgeInsets.all(40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                verifivation_code_input_field(),
                                verifivation_code_input_field(),
                                verifivation_code_input_field(),
                                verifivation_code_input_field()
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Container(
                            width: size.width * 0.8,
                            //alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'having a problem? ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Resend code',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8, left: 8, right: 8),
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
                              onPressed: () {
                                //print('Login button pressed');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResetPassword()),
                                );
                              },
                              child: const Text(
                                'Verify Code',
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

class verifivation_code_input_field extends StatelessWidget {
  const verifivation_code_input_field({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: hexToColor('#F0F6FA'),
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          // style: Theme.of(context).textTheme.headline6,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ));
  }
}

Color hexToColor(String hexString) {
  return Color(int.parse(hexString.substring(1, 7), radix: 16) + 0xFF000000);
}
