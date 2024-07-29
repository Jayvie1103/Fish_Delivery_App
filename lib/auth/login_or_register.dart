import 'package:flutter/material.dart';
import 'package:fish_delivery_app/pages/login_page.dart';
import 'package:fish_delivery_app/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();

  signOut() {}
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePages() {
    if (mounted) {
      setState(() {
        showLoginPage = !showLoginPage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showLoginPage
          ? LoginPage(onTap: togglePages)
          : RegisterPage(onTap: togglePages),
    );
  }
}
