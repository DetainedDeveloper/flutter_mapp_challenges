import 'package:flutter/material.dart';
import 'package:flutter_mapp_challenges/week_1/screens/books_screen_body.dart';
import 'package:google_fonts/google_fonts.dart';

class Week1App extends StatelessWidget {
  const Week1App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 1 App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        shadowColor: const Color(0xFFD0D0D0),
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const BooksScreenBody(),
      debugShowCheckedModeBanner: false,
    );
  }
}
