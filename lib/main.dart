import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munchmate/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MunchMate',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: GoogleFonts.ralewayTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}
