import 'package:flutter/material.dart';
import 'package:fish_delivery_app/models/fish.dart'; // Import your Fish class file

class MyDescriptionBox extends StatelessWidget {
  final List<Fish> purchasedItems; // List of purchased fish items
  final double deliveryFee; // Delivery fee
  final String deliveryTime; // Delivery time

  const MyDescriptionBox({
    super.key,
    required this.purchasedItems,
    required this.deliveryFee,
    required this.deliveryTime,
  });

  @override
  Widget build(BuildContext context) {
    // Text styles
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.surface,
    );
    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white, // Ensure the background color is set
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Purchased items
          Text(
            'Purchased Items:',
            style: mySecondaryTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Check if there are purchased items
          if (purchasedItems.isNotEmpty)
            ...purchasedItems.map((item) => Text(
              '${item.name} - ₱${item.price.toStringAsFixed(2)} (${item.weight} kg)',
              style: myPrimaryTextStyle,
            )),
          if (purchasedItems.isEmpty)
            Text(
              'No items purchased.',
              style: myPrimaryTextStyle,
            ),
          const SizedBox(height: 20),
          // Delivery fee
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery Fee:', style: mySecondaryTextStyle),
              Text('₱${deliveryFee.toStringAsFixed(2)}', style: myPrimaryTextStyle),
            ],
          ),
          const SizedBox(height: 10),
          // Delivery time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Estimated Delivery Time:', style: mySecondaryTextStyle),
              Text(deliveryTime, style: myPrimaryTextStyle),
            ],
          ),
        ],
      ),
    );
  }
}
