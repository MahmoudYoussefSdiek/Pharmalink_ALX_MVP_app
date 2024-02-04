import 'package:flutter/material.dart';
import 'package:pharmalink/presentation/components/widgets/custom_button.dart';
import 'package:pharmalink/presentation/components/widgets/custom_text_form_field.dart';
import 'package:pharmalink/presentation/components/widgets/logo_widget.dart';
import 'package:pharmalink/presentation/screens/home_screen.dart';


class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});
  static const String route = '/new_password';

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordValid = true;
  bool _isConfirmPasswordValid = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();


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
                    const SizedBox(height: 29.0),
                    const Text(
                      'Reset Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF223263),
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.50,
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'New Password',
                      isPassword: true,
                      colorFlag: _isPasswordValid,
                      prefixIcon: Icons.lock_outline_rounded,
                      validator: validatePassword,
                    ),
                    const SizedBox(height: 22.0),
                    CustomTextField(
                      controller: _confirmPasswordController,
                      hintText: 'Confirm Password',
                      isPassword: true,
                      colorFlag: _isConfirmPasswordValid,
                      prefixIcon: Icons.lock_outline_rounded,
                      validator: validateconfirmPassword,
                    ),
                    const SizedBox(height: 52.0),
                    CustomButton(
                      function: verifyNewPassword,
                      text: 'Confirm',
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

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        _isPasswordValid = false;
      });
      return 'Enter a valid password';
    } else {
      setState(() {
        _isPasswordValid = true;
      });
      return null;
    }
  }

  String? validateconfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        _isConfirmPasswordValid = false;
      });
      return 'Enter a valid password';
    } else {
      setState(() {
        _isConfirmPasswordValid = true;
      });
      return null;
    }
  }

  void verifyNewPassword() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pushReplacementNamed(context, HomeScreen.route);
      // Fluttertoast.showToast(
      //     msg: 'Password Changed Successfully',
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: const Color(0xFF5A5A5A),
      //     textColor: Colors.white,
      //     fontSize: 16.0);

    }
  }
}
