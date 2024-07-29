import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fish_delivery_app/components/my_button.dart';
import 'package:fish_delivery_app/components/my_textfield.dart';
import 'package:fish_delivery_app/pages/home_page.dart';


class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? emailError;
  String? passwordError;

  void login() {
    setState(() {
      emailError = emailController.text.isEmpty ? "Email cannot be empty" : null;
      passwordError = passwordController.text.isEmpty ? "Password cannot be empty" : null;

      if (emailError == null && passwordError == null) {
        // Validate email and password format
        if (authenticateUser(emailController.text, passwordController.text)) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        } else {
          emailError = "Invalid email or password";
          passwordError = "Invalid email or password";
        }
      }
    });
  }

  bool authenticateUser(String email, String password) {
    // Simple validation for demo purposes
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    final isEmailValid = emailRegExp.hasMatch(email);
    final isPasswordValid = password.length >= 8;

    return isEmailValid && isPasswordValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0800FF),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(
                FontAwesomeIcons.fish,
                size: 72,
                color: Colors.white,
              ),
              const SizedBox(height: 25),
              const Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
                textColor: Colors.white,
                hintTextColor: Colors.white70,
                backgroundColor: Colors.blue[700]!,
                errorText: emailError,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
                textColor: Colors.white,
                hintTextColor: Colors.white70,
                backgroundColor: Colors.blue[700]!,
                errorText: passwordError,
              ),
              const SizedBox(height: 10),
              MyButton(
                text: "Login",
                onTap: login,
                textColor: Colors.blue,
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Register now",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
