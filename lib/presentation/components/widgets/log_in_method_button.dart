import 'package:flutter/material.dart';

class LogInMethodButton extends StatelessWidget {
  const LogInMethodButton(
      {super.key,
      required this.buttonText,
      required this.imagePath,
      required this.function});

  final String buttonText;
  final String imagePath;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF9098B1),
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFEAEFFF)),
            borderRadius: BorderRadius.circular(5),
          ),
          shadowColor: const Color(0x3D40BFFF),
          elevation: 5,
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF9098B1),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
