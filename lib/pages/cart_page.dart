import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fish_delivery_app/components/my_cart_tile.dart';
import 'package:fish_delivery_app/models/fishmarket.dart';
import 'package:fish_delivery_app/pages/payment_page.dart'; // Ensure this import is correct

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  bool _isPressed = false; // Track button press state

  void showClearCartDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Clear Cart'),
          content: const Text('Are you sure you want to clear the cart?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context.read<Fishmarket>().clearCart();
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Fishmarket>(
      builder: (context, fishmarket, child) {
        final userCart = fishmarket.cart;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
            backgroundColor: Colors.blueAccent,
            actions: [
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: userCart.isNotEmpty ? showClearCartDialog : null,
              ),
            ],
          ),
          body: userCart.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Cart is empty',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: userCart.length,
                  itemBuilder: (context, index) {
                    // get individual cart item
                    final cartItem = userCart[index];
                    // return cart tile UI
                    return MyCartTile(cartItem: cartItem);
                  },
                ),
          bottomNavigationBar: userCart.isNotEmpty
              ? BottomAppBar(
                  child: GestureDetector(
                    onLongPress: () {
                      setState(() {
                        _isPressed = true;
                      });
                    },
                    onLongPressUp: () {
                      setState(() {
                        _isPressed = false;
                      });
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PaymentPage()),
                      );
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: _isPressed ? Colors.green : Colors.blue, // Change color based on press state
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Go to Checkout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : null,
        );
      },
    );
  }
}
