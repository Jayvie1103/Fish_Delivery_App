import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/my_drawer_tile.dart';
import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the colors used in your login page
    const Color blueBackgroundColor = Colors.blue; // Replace with actual blue color used
    const Color textColor = Colors.white; // Adjust if different text color is used

    return Drawer(
      backgroundColor: blueBackgroundColor, // Apply background color
      child: Column(
        children: [
          // App logo
          const Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: FaIcon(
              FontAwesomeIcons.fish,
              size: 80,
              color: textColor, // Apply text color
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Divider(
              color: textColor, // Apply divider color
            ),
          ),
          // Home list tile
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
            iconColor: textColor, // Apply icon color
            textColor: textColor, // Apply text color
          ),
          // Settings list tile
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
            iconColor: textColor, // Apply icon color
            textColor: textColor, // Apply text color
          ),

          const Spacer(),

          // Logout list tile
          MyDrawerTile(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: () {},
            iconColor: textColor, // Apply icon color
            textColor: textColor, // Apply text color
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
