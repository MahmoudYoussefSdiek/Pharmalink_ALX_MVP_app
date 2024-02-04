import 'package:flutter/material.dart';
import 'package:pharmalink/presentation/components/widgets/custom_button.dart';
import 'package:pharmalink/presentation/components/widgets/custom_text_form_field.dart';
import 'package:pharmalink/presentation/components/widgets/logo_widget.dart';
import 'package:pharmalink/presentation/screens/change_password_screens/verfication_code_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  static const String route = '/forget_password';

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isEmailValid = true;
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const LogoWidget(),
                    const SizedBox(height: 28.0),
                    const Text(
                      'Forget Password',
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
                      'Add your email to send code',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF9098B1),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.50,
                      ),
                    ),
                    const SizedBox(height: 69.0),
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'Your Email',
                      isPassword: false,
                      colorFlag: _isEmailValid,
                      prefixIcon: Icons.email_outlined,
                      validator: validateEmail,
                    ),
                    const SizedBox(height: 31.0),
                    CustomButton(
                      function: verifyAccount,
                      text: 'SEND',
                    ),
                  ],
                ),
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

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || !value.contains('@')) {
      setState(() {
        _isEmailValid = false;
      });
      return 'Enter a valid email address';
    } else {
      setState(() {
        _isEmailValid = true;
      });
      return null;
    }
  }

  void verifyAccount() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pushReplacementNamed(context, VerficationCodeScreen.route);
    }
  }
}
