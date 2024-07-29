import 'package:flutter/material.dart';
import 'package:fish_delivery_app/components/my_quantity_selector.dart';
import 'package:fish_delivery_app/models/cart_item.dart';
import 'package:provider/provider.dart';
import 'package:fish_delivery_app/models/fishmarket.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Fishmarket>(
      builder: (context, fishMarket, child) => Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.fish.imagePath,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Name and price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.fish.name,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '₱${cartItem.totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // Show confirmation dialog before removing
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Remove Item'),
                            content: const Text('Are you sure you want to remove this item from the cart?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  fishMarket.removeItemFromCart(cartItem);
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Remove'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Quantity selector
            QuantitySelector(
              quantity: cartItem.quantity,
              fish: cartItem.fish,
              onIncrement: () => fishMarket.incrementQuantity(cartItem),
              onDecrement: () => fishMarket.decrementQuantity(cartItem),
            ),
            // Add-ons
            if (cartItem.selectedAddons.isNotEmpty) ...[
              const SizedBox(height: 10),
              Text(
                'Add-ons:',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 60, // Adjust height as needed
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: cartItem.selectedAddons.map((addon) {
                    return Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2, // Thicker border
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${addon.name} - ₱${addon.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16, // Larger font size
                            color: Theme.of(context).colorScheme.onSurface, // Clear text color
                            fontWeight: FontWeight.bold, // Bold text
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
