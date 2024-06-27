import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'package:flutter_application_1/intro_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        textTheme: latoTextTheme,
      ),
      home: IntroScreen(),
    );
  }
}

final TextTheme latoTextTheme = TextTheme(
  displayLarge: GoogleFonts.nunitoSans(
      fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  displayMedium: GoogleFonts.nunitoSans(
      fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  displaySmall:
      GoogleFonts.nunitoSans(fontSize: 46, fontWeight: FontWeight.w400),
  headlineLarge: GoogleFonts.nunitoSans(
      fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 0.25),
  headlineMedium:
      GoogleFonts.nunitoSans(fontSize: 23, fontWeight: FontWeight.w400),
  headlineSmall: GoogleFonts.nunitoSans(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  titleLarge: GoogleFonts.nunitoSans(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  titleMedium: GoogleFonts.nunitoSans(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  titleSmall: GoogleFonts.nunitoSans(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyLarge: GoogleFonts.nunitoSans(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  bodyMedium: GoogleFonts.nunitoSans(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  bodySmall: GoogleFonts.nunitoSans(
      fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  labelSmall: GoogleFonts.nunitoSans(
      fontSize: 9, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
