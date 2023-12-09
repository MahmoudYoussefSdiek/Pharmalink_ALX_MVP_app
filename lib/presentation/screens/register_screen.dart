import 'package:flutter/material.dart';
import 'package:pharmalink/presentation/components/widgets/custom_button.dart';
import 'package:pharmalink/presentation/components/widgets/custom_text_button.dart';
import 'package:pharmalink/presentation/components/widgets/custom_text_form_field.dart';
import 'package:pharmalink/presentation/components/widgets/logo_widget.dart';
import 'package:pharmalink/presentation/screens/home_screen.dart';
import 'package:pharmalink/presentation/screens/log_in_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String route = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isFullNameValid = true;
  bool _isEmailValid = true;
  bool _isPhoneNumberValid = true;
  bool _isPasswordValid = true;
  bool _isConfirmPasswordValid = true;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const LogoWidget(),
                    const SizedBox(height: 71.0),
                    const Text(
                      'Let’s Get Started',
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
                      'Create an new account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF9098B1),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.50,
                      ),
                    ),
                    const SizedBox(height: 28.0),
                    CustomTextField(
                      controller: _fullNameController,
                      hintText: 'Full Name',
                      isPassword: false,
                      colorFlag: _isFullNameValid,
                      prefixIcon: Icons.person_outline_rounded,
                      validator: validateFullName,
                    ),
                    const SizedBox(height: 8.0),
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'Your Email',
                      isPassword: false,
                      colorFlag: _isEmailValid,
                      prefixIcon: Icons.email_outlined,
                      validator: validateEmail,
                    ),
                    const SizedBox(height: 8.0),
                    CustomTextField(
                      controller: _phoneNumberController,
                      hintText: 'Your Phone',
                      isPassword: false,
                      colorFlag: _isPhoneNumberValid,
                      prefixIcon: Icons.phone,
                      validator: validatePhoneNumber,
                    ),
                    const SizedBox(height: 8.0),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      prefixIcon: Icons.lock_outline_rounded,
                      isPassword: true,
                      colorFlag: _isPasswordValid,
                      validator: validatePassword,
                    ),
                    const SizedBox(height: 8.0),
                    CustomTextField(
                      controller: _confirmPasswordController,
                      hintText: 'Confirm Password',
                      prefixIcon: Icons.lock_outline_rounded,
                      isPassword: true,
                      colorFlag: _isConfirmPasswordValid,
                      validator: validateconfirmPassword,
                    ),
                    const SizedBox(height: 8.0),
                    CustomButton(
                      function: signUp,
                      text: 'Sign Up',
                    ),
                    const SizedBox(height: 21.0),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'have a account?',
                            style: TextStyle(
                              color: Color(0xFF9098B1),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.50,
                            ),
                          ),
                          CustomTextButton(
                              text: 'Sign In',
                              function: () {
                                Navigator.pushReplacementNamed(
                                    context, LogInScreen.route);
                              }),
                        ],
                      ),
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
            margin: EdgeInsets.only(bottom: 10), // Adjust the margin as needed
            child: Opacity(
              opacity: 0.50,
              child: Container(
                width: 134,
                height: 5,
                decoration: ShapeDecoration(
                  color: Color(0xFFD1D6E7),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xFF9098B1)),
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

  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        _isFullNameValid = false;
      });
      return 'Enter a valid name';
    } else {
      setState(() {
        _isFullNameValid = true;
      });
      return null;
    }
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

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        _isPhoneNumberValid = false;
      });
      return 'Enter a valid phone number';
    } else {
      setState(() {
        _isPhoneNumberValid = true;
      });
      return null;
    }
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

  void signUp() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pushReplacementNamed(context, HomeScreen.route);
    }
  }
}
