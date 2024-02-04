import 'package:flutter/material.dart';
import 'package:pharmalink/presentation/components/widgets/custom_button.dart';
import 'package:pharmalink/presentation/components/widgets/logo_widget.dart';
import 'package:pharmalink/presentation/screens/change_password_screens/new_password_screen.dart';

class VerficationCodeScreen extends StatefulWidget {
  const VerficationCodeScreen({super.key});
  static const String route = '/verfication_code';

  @override
  State<VerficationCodeScreen> createState() => _VerficationCodeScreenState();
}

class _VerficationCodeScreenState extends State<VerficationCodeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const LogoWidget(),
                  const SizedBox(height: 28.0),
                  const Text(
                    'Verify Your Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF223263),
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.50,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'check your Email',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF9098B1),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.50,
                    ),
                  ),
                  const SizedBox(height: 148.0),
                  CustomButton(
                    function: verifyAccount,
                    text: 'Verify',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 34,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Opacity(
              opacity: 0.50,
              child: Container(
                width: 134,
                height: 5,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD1D6E7),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF9098B1)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void verifyAccount() {
      Navigator.pushReplacementNamed(context, NewPasswordScreen.route);
  }
}