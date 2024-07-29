import 'package:flutter/material.dart';
import 'package:fish_delivery_app/pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    // Define the blue color used in your login page
    const Color blueBackgroundColor = Colors.blue; // Replace with the actual color code

    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        // Cart button
        IconButton(
          onPressed: () {
            // Go to page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          },
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
      backgroundColor: blueBackgroundColor, // Apply the blue background color
      foregroundColor: Colors.white, // Adjust the foreground color if needed
      centerTitle: true,
      elevation: 0, // Remove shadow or line at the top
      title: const Center(
        child: Text(
          'Mabini Online Fish Market',
          style: TextStyle(
            color: Colors.white, // Ensure text is readable
            fontWeight: FontWeight.bold, // Match style to login page
            fontSize: 20, // Adjust size if needed
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
      // Remove the bottom border line by setting the bottom border color to transparent
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(color: Colors.transparent),
      ),
    );
  }
}
