import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fish_delivery_app/components/my_button.dart';
import 'package:fish_delivery_app/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  void register() {
    setState(() {
      emailError = validateEmail(emailController.text);
      passwordError = validatePassword(passwordController.text);
      confirmPasswordError = validateConfirmPassword(passwordController.text, confirmPasswordController.text);

      if (emailError == null && passwordError == null && confirmPasswordError == null) {
        // Registration logic
      }
    });
  }

  String? validateEmail(String email) {
    if (email.isEmpty) return "Email cannot be empty";
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email)) {
      return "Invalid email format";
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) return "Password cannot be empty";
    if (password.length < 8) return "Password must be at least 8 characters long";
    return null;
  }

  String? validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) return "Confirm password cannot be empty";
    if (confirmPassword != password) return "Passwords do not match";
    return null;
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
                "Create Account",
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
              MyTextField(
                controller: confirmPasswordController,
                hintText: "Confirm Password",
                obscureText: true,
                textColor: Colors.white,
                hintTextColor: Colors.white70,
                backgroundColor: Colors.blue[700]!,
                errorText: confirmPasswordError,
              ),
              const SizedBox(height: 10),
              MyButton(
                text: "Register",
                onTap: register,
                textColor: Colors.blue,
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Login now",
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
