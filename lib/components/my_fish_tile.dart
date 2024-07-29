import 'package:flutter/material.dart';
import '../models/fish.dart';

class FishTile extends StatelessWidget {
  final Fish fish;
  final void Function()? onTap;

  const FishTile({
    super.key,
    required this.fish,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                // Text fish details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fish.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${fish.weight.toString()} kg', // Specify unit here
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        '₱${fish.price.toStringAsFixed(2)}', // Format price to two decimal places
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        fish.description,
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(width: 15),
                
                // Fish image with fixed size
               ClipRRect(
                  borderRadius: BorderRadius.circular(8), // Radius for rounded corners
                  child: SizedBox(
                  height: 120,
                  width: 170,
                  child: Image.asset(
                  fish.imagePath,
                  fit: BoxFit.cover, // Ensure image covers the box
                   ),
                 ),
              )
              ],
            ),
          ),
        ),

        

        // divider line 
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        )
      ],
    );
  }
}
