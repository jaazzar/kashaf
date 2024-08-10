import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wosul_app/views/screens/welcome.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wosul App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          textTheme:
              GoogleFonts.notoSansArabicTextTheme(Theme.of(context).textTheme),
          iconTheme: const IconThemeData(color: Colors.white),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: const Color.fromARGB(52, 158, 158, 158),
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.0),
                borderSide: BorderSide.none),
          ),
          appBarTheme: const AppBarTheme(color: Color(0xff1F3B97))),
      home: const WelcomeScreen(),
    );
  }
}
