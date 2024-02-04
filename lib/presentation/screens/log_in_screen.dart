import 'package:flutter/material.dart';
import 'package:pharmalink/presentation/components/widgets/custom_button.dart';
import 'package:pharmalink/presentation/components/widgets/custom_text_button.dart';
import 'package:pharmalink/presentation/components/widgets/custom_text_form_field.dart';
import 'package:pharmalink/presentation/components/widgets/log_in_method_button.dart';
import 'package:pharmalink/presentation/components/widgets/logo_widget.dart';
import 'package:pharmalink/presentation/screens/change_password_screens/forget_password_screen.dart';
import 'package:pharmalink/presentation/screens/home_screen.dart';
import 'package:pharmalink/presentation/screens/register_screen.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  static const String route = '/login';

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isEmailValid = true;
  bool _isPasswordValid = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const LogoWidget(),
                    const SizedBox(height: 30.0),
                    const Text(
                      'Welcome To Pharmalink',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF223263),
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.50,
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    Text(
                      'Sign in to continue',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 28.0),
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'Your Email',
                      isPassword: false,
                      colorFlag: _isEmailValid,
                      prefixIcon: Icons.email_outlined,
                      validator: validateEmail,
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      prefixIcon: Icons.lock_outline_rounded,
                      isPassword: true,
                      colorFlag: _isPasswordValid,
                      validator: validatePassword,
                    ),
                    const SizedBox(height: 16.0),
                    CustomButton(
                      function: signIn,
                      text: 'Sign In',
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            //width: 134,
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFFEAEFFF),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Center(
                          widthFactor: 3.0,
                          child: Text(
                            'OR',
                            style: TextStyle(
                              color: Color(0xFF9098B1),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.07,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            // width: 134,
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFFEAEFFF),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    LogInMethodButton(
                        buttonText: 'Login with Google',
                        imagePath: 'assets/Icons/google_icon.png',
                        function: () {}),
                    const SizedBox(height: 8.0),
                    LogInMethodButton(
                        buttonText: 'Login with facebook',
                        imagePath: 'assets/Icons/facebook_icon.png',
                        function: () {}),
                    const SizedBox(height: 21.0),
                    CustomTextButton(text: 'Forgot Password?', function: () {
                      Navigator.pushReplacementNamed(context, ForgetPasswordScreen.route);
                    }),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have a account?',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          CustomTextButton(
                              text: 'Register',
                              function: () {
                                Navigator.pushReplacementNamed(
                                    context, RegisterScreen.route);
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

  void signIn() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pushReplacementNamed(context, HomeScreen.route);
    }
  }
}
