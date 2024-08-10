import 'package:flutter/material.dart';
import 'package:wosul_app/controllers/userController.dart';
import 'package:wosul_app/views/screens/Dashboard.dart';

import '../widgets/center_description.dart';
import '../widgets/center_title.dart';
import '../widgets/input_field_with_label.dart';
import '../widgets/top_logo.dart';
import 'forgot_password.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController merchController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void resetStoreList() {
    setState(() {
      StoreList = null;
    });
  }

  var _rememberMe = false;
  var errorText = null;
  var codeErrorText = null;
  var loginByEmail = true;
  var _isLoading = false;
  List? StoreList = null;

  void submit() async {
    setState(() {
      _isLoading = true;
    });

    if (loginByEmail) {
      if (!emailValidator(emailController.text)) {
        setState(() {
          errorText = "Please enter a valid email";
        });
      } else {
        StoreList = await ref
            .watch(userControllerProvider.notifier)
            .getStoreListByEmail(emailController.text);

        await ref
            .watch(userControllerProvider.notifier)
            .getUserByEmailAndPassword(emailController.text,
                passwordController.text, merchController.text);
      }
    } else {
      StoreList = await ref
          .watch(userControllerProvider.notifier)
          .getStoreListByCode(codeController.text);

      setState(() {
        codeErrorText = "invalid code ";
        _isLoading = false;

        return;
      });
      codeErrorText = null;

      await ref
          .watch(userControllerProvider.notifier)
          .getUserByCode(codeController.text, merchController.text);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userControllerProvider);

    var size = MediaQuery.of(context).size;
    return (user != null)
        ? const DashboardScreen()
        : SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      height: size.height / 2,
                      child: const Image(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/Subtract.png"),
                      ),
                    ),
                  ),
                  Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Column(
                              children: [
                                CenterTitle(title: const Text('تسجيل دخول')),
                                CenterDiscription1(
                                    title:
                                        const Text('! اهلا فيك, اشتقنا لك ')),
                              ],
                            ),
                            const SizedBox(height: 30),
                            // Container(
                            //   margin:
                            //       const EdgeInsets.symmetric(horizontal: 17),
                            //   width: size.width / 1.2,
                            //   // height: size.height / 20, // 45
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.circular(10.0),
                            //   ),
                            //   child: TabBar(
                            //     onTap: (value) {
                            //       setState(() {
                            //         StoreList = null;
                            //         passwordController.clear();
                            //         emailController.clear();
                            //         codeController.clear();
                            //         merchController.clear();
                            //         loginByEmail = (value == 0) ? true : false;
                            //       });
                            //     },
                            //     indicatorSize: TabBarIndicatorSize.tab,
                            //     indicatorPadding: const EdgeInsets.all(5),
                            //     indicator: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(10.0),
                            //         color:
                            //             const Color.fromRGBO(30, 64, 175, 1)),
                            //     labelColor: Colors.white,
                            //     unselectedLabelColor: Colors.black,
                            //     tabs: const [
                            //       Tab(child: Text("By Email")),
                            //       Tab(child: Text("By Code")),
                            //     ],
                            //     controller: _tabController,
                            //   ),
                            // ),
                            // const SizedBox(height: 50),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                  width: size.width * .9,
                                  padding: const EdgeInsets.only(
                                      top: 20, right: 5, left: 5, bottom: 15),
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
                                          offset: const Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ]),
                                  child: Column(
                                    children: [
                                      if (loginByEmail)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20.0, left: 20, right: 20),
                                          child: InpuFieldWithLabel(
                                            label: const Text('الايميل '),
                                            hint:
                                                const Text('example@gmail.com'),
                                            controller: emailController,
                                            errorText: errorText,
                                          ),
                                        ),

                                      const SizedBox(
                                        height: 25,
                                      ),
                                      if (loginByEmail)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: InpuFieldWithLabel(
                                              label: const Text('كلمة السر '),
                                              hint: const Text('********'),
                                              isPassword: true,
                                              controller: passwordController),
                                        ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      // if (StoreList != null)
                                      //   DropdownButton<int>(
                                      //     iconSize: 30,
                                      //     borderRadius:
                                      //         BorderRadius.circular(12),
                                      //     padding: const EdgeInsets.symmetric(
                                      //         horizontal: 50),
                                      //     isExpanded: true,
                                      //     menuMaxHeight: 300,
                                      //     value: StoreId,
                                      //     items: StoreList!
                                      //         .map((store) => DropdownMenuItem(
                                      //             value: store['id'] as int,
                                      //             child: Text(store['name'])))
                                      //         .toList(),
                                      //     onChanged: (value) {
                                      //       setState(() {
                                      //         StoreId = value;
                                      //       });
                                      //     },
                                      //   ),

                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Checkbox(
                                                    value: _rememberMe
                                                        ? true
                                                        : false,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _rememberMe =
                                                            !_rememberMe;
                                                      });
                                                    },
                                                    checkColor: Colors.white,
                                                  ),
                                                  const Text(
                                                    'تذكرني',
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ForgotPassword()),
                                                  );
                                                },
                                                child: Text(
                                                  'نسيت كلمة السر؟',
                                                  style: TextStyle(
                                                      color:
                                                          hexToColor('#1F3B97'),
                                                      fontSize: 16,
                                                      decoration: TextDecoration
                                                          .underline),
                                                ),
                                              )
                                            ]),
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
                                                  const Color.fromRGBO(
                                                      30, 64, 175, 1),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                              ),
                                            ),
                                            onPressed: () =>
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (_) {
                                              return const DashboardScreen();
                                            })),
                                            child: _isLoading
                                                ? const SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                : const Text(
                                                    "تسجيل",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

bool emailValidator(String email) {
  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  return emailValid;
}

// BoxDecoration _backgroundImage() {
//   return const BoxDecoration(
//     image: DecorationImage(
//         image: AssetImage("assets/images/Subtract.png"),
//         fit: BoxFit.fitWidth,
//         alignment: Alignment.bottomCenter),
//   );
// }

// ref
//       .watch(userControllerProvider.notifier)
//       .getUserByCode("30326", 1);

Color hexToColor(String hexString) {
  return Color(int.parse(hexString.substring(1, 7), radix: 16) + 0xFF000000);
}




//  Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                             top: 20.0, left: 20, right: 20),
//                                         child: InpuFieldWithLabel(
//                                           label: const Text('Code '),
//                                           hint: const Text('123456'),
//                                           controller: codeController,
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 20),
//                                         child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Checkbox(
//                                                     value: _rememberMe
//                                                         ? true
//                                                         : false,
//                                                     onChanged: (value) {
//                                                       setState(() {
//                                                         _rememberMe =
//                                                             !_rememberMe;
//                                                       });
//                                                     },
//                                                     checkColor: Colors.white,
//                                                   ),
//                                                   const Text(
//                                                     'Remember',
//                                                     style:
//                                                         TextStyle(fontSize: 16),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ]),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                             bottom: 8, left: 8, right: 8),
//                                         child: SizedBox(
//                                           height: 50,
//                                           width: size.width * 0.8,
//                                           child: ElevatedButton(
//                                             style: ElevatedButton.styleFrom(
//                                               backgroundColor:
//                                                   const Color.fromRGBO(
//                                                       30, 64, 175, 1),
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(14),
//                                               ),
//                                             ),
//                                             onPressed: () {},
//                                             child: const Text(
//                                               "login",
//                                               style: TextStyle(
//                                                   color: Colors.white),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   )),




                // Padding(
                //         padding: const EdgeInsets.all(12.0),
                //         child: SizedBox(
                //           height: size.height * 0.1,
                //           width: size.width * 0.80,
                //           child: Row(children: [
                //             Container(
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.only(
                //                     topLeft: Radius.circular(10),
                //                     bottomLeft: Radius.circular(10)),
                //                 color: loginByEmail
                //                     ? hexToColor('#1F3B97')
                //                     : Color.fromARGB(255, 78, 78, 78),
                //               ),
                //               width: size.width * 0.40,
                //               child: TextButton(
                //                   onPressed: () {
                //                     if (!loginByEmail) {
                //                       setState(() {
                //                         loginByEmail = true;
                //                       });
                //                     }
                //                   },
                //                   child: const Text(
                //                     'by email',
                //                     style: TextStyle(color: Colors.white),
                //                   )),
                //             ),
                //             Container(
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.only(
                //                     topRight: Radius.circular(10),
                //                     bottomRight: Radius.circular(10)),
                //                 color: !loginByEmail
                //                     ? hexToColor('#1F3B97')
                //                     : Color.fromARGB(255, 78, 78, 78),
                //               ),
                //               width: size.width * 0.40,
                //               child: TextButton(
                //                   onPressed: () {
                //                     if (loginByEmail) {
                //                       setState(() {
                //                         loginByEmail = false;
                //                       });
                //                     }
                //                   },
                //                   child: Text('by code',
                //                       style: TextStyle(color: Colors.white))),
                //             ),
                //           ]),
                //         ),
                //       ),