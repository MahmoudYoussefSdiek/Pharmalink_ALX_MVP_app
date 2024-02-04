import 'package:flutter/material.dart';
import 'package:pharmalink/app_route.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(Pharmalink());
}

class Pharmalink extends StatelessWidget {
  final AppRoute _appRoute = AppRoute();
  Pharmalink({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => _appRoute.generateRoute(settings),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryTextTheme: const TextTheme(
          bodySmall: TextStyle(
            color: Color(0xFF9098B1),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.50,
          ),
          bodyMedium: TextStyle(
            color: Color(0xFFFB7181),
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.50,
          ),
          bodyLarge: TextStyle(
            color: Color(0xFF223263),
            fontSize: 16,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.50,
          ),
          labelMedium: TextStyle(
            color: Color(0xFFED1C24),
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.50,
          ),
        ) ,
      ),
    );
  }
}