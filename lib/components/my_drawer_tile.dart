import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;
  final Color iconColor; // Add iconColor parameter
  final Color textColor; // Add textColor parameter

  const MyDrawerTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.iconColor, // Add iconColor
    required this.textColor, // Add textColor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(color: textColor), // Use textColor
        ),
        leading: Icon(
          icon,
          color: iconColor, // Use iconColor
        ),
        onTap: onTap,
      ),
    );
  }
}