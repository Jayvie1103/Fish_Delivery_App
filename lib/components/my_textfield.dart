import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Color textColor;
  final Color hintTextColor;
  final Color backgroundColor;
  final String? errorText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.textColor,
    required this.hintTextColor,
    required this.backgroundColor,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: hintTextColor),
          errorText: errorText,
          errorStyle: const TextStyle(color: Colors.white), // White color for error text
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.5),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.5),
          ),
        ),
      ),
    );
  }
}
