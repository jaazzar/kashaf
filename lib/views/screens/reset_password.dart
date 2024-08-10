import 'package:flutter/material.dart';
import 'package:wosul_app/views/widgets/center_description.dart';
import 'package:wosul_app/views/widgets/center_title.dart';
import 'package:wosul_app/views/widgets/input_field_with_label.dart';
import 'package:wosul_app/views/widgets/top_logo.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}
var _rememberMe = false;
var _showPassword = false;

class _ResetPasswordState extends State<ResetPassword> {
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
              CenterTitle(title: Text('Reset Password')),
              CenterDiscription1(
                  title:
                      Text('We will send you a link to reset your password')),
              SizedBox(height: size.height * 0.15),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
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
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 20, right: 20),
                          child: InpuFieldWithLabel(
                            controller: TextEditingController(),
                            label: Text('Password '),
                            hint: Text('********'),
                            isPassword: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: InpuFieldWithLabel(
                            controller: TextEditingController(),
                            label: Text('Re-enter password '),
                            hint: Text('********'),
                            isPassword: true,
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
                              },
                              child: const Text(
                                'Submit',
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








// import 'package:flutter/material.dart';
// import 'package:wosul_app/views/widgets/center_description.dart';
// import 'package:wosul_app/views/widgets/center_title.dart';
// import 'package:wosul_app/views/widgets/input_field_with_label.dart';
// import 'package:wosul_app/views/widgets/top_logo.dart';

// class ResetPassword extends StatefulWidget {
//   ResetPassword({super.key});

//   @override
//   State<ResetPassword> createState() => _ResetPasswordState();
// }

// var _rememberMe = false;
// var _showPassword = false;

// class _ResetPasswordState extends State<ResetPassword> {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         resizeToAvoidBottomInset: false,
//         body: Stack(
//           fit: StackFit.expand,
//           children: [
//             Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Image(image: AssetImage("assets/images/Subtract.png"))),
//             TopLogo(),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Column(
//                   children: [
//                     CenterTitle(title: Text('Reset Password')),
//                     CenterDiscription1(
//                         title: Text(
//                             'We will send you a link to reset your password')),
//                   ],
//                 ),
//                 SizedBox(height: size.height * 0.15),
//                 Align(
//                   alignment: Alignment.center,
//                   child: Container(
//                     width: size.width * .9,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(30),
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.3),
//                             spreadRadius: 5,
//                             blurRadius: 7,
//                             offset: const Offset(
//                                 0, 0), // changes position of shadow
//                           ),
//                         ]),
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               top: 20.0, left: 20, right: 20),
//                           child: InpuFieldWithLabel(
//                             label: Text('Password '),
//                             hint: Text('********'),
//                             isPassword: true,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 20, right: 20),
//                           child: InpuFieldWithLabel(
//                             label: Text('Re-enter password '),
//                             hint: Text('********'),
//                             isPassword: true,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               bottom: 8, left: 8, right: 8),
//                           child: SizedBox(
//                             height: 50,
//                             width: size.width * 0.8,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor:
//                                     const Color.fromRGBO(30, 64, 175, 1),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(14),
//                                 ),
//                               ),
//                               onPressed: () {
//                                 //print('Login button pressed');
//                               },
//                               child: const Text(
//                                 'Submit',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text(
//                       'Already have an account? Sign In',
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.w900),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   BoxDecoration _backgroundImage() {
//     return const BoxDecoration(
//       image: DecorationImage(
//           image: AssetImage("lib/assets/images/Subtract.png"),
//           fit: BoxFit.fitWidth,
//           alignment: Alignment.bottomCenter),
//     );
//   }
// }

// Color hexToColor(String hexString) {
//   return Color(int.parse(hexString.substring(1, 7), radix: 16) + 0xFF000000);
// }
