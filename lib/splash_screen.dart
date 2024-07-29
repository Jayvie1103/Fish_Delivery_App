import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fish_delivery_app/auth/login_or_register.dart'; // Ensure this import is correct and needed

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key}); // Added key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0800FF), // Changed to light blue
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo/mabini_fish_app_logo.png'), // Path to your logo
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class SplashScreenState extends StatefulWidget {
  const SplashScreenState({super.key}); // Added key parameter

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenState> {
  @override
  void initState() {
    super.initState();
    _navigateToLoginOrRegister();
  }

  void _navigateToLoginOrRegister() {
    Timer(const Duration(seconds: 7), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginOrRegister()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen(); // Should ideally be `SplashScreenState` to be consistent with naming
  }
}
