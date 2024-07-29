import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fish_delivery_app/models/fishmarket.dart';
import '../models/fish.dart';

class FishPage extends StatefulWidget {
  final Fish fish;

  const FishPage({super.key, required this.fish});

  @override
  State<FishPage> createState() => _FishPageState();
}

class _FishPageState extends State<FishPage> {
  // Initial weight of the fish that the customer wants to buy
  double _selectedWeight = 1.0;
  // State to track selected add-ons
  late Map<Addon, bool> selectedAddons;
  // Flag to track if the item has been added to the cart
  bool _isAddedToCart = false;
  // State for button color
  Color _buttonColor = Colors.blue;

  // Method to add to cart
  void addToCart(Fish fish, Map<Addon, bool> selectedAddons) {
    setState(() {
      _isAddedToCart = true; // Update state to reflect that item has been added
    });

    // Close the current fish page to go back to the menu
    Navigator.pop(context);

    // Format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.fish.availableAddons) {
      if (selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    // Add item to the cart
    context.read<Fishmarket>().addItemToCart(fish, _selectedWeight.toInt(), currentlySelectedAddons);
  }

  @override
  void initState() {
    super.initState();
    // Initialize selectedAddons to false for each addon
    selectedAddons = {
      for (Addon addon in widget.fish.availableAddons) addon: false
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Modern Android Back Button
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.fish.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Fish image
              Image.asset(widget.fish.imagePath),

              // Fish name
              Text(
                widget.fish.name,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              // Weight selector
              Row(
                children: [
                  Text(
                    'Weight: ${_selectedWeight.toStringAsFixed(1)} kg',
                    style: const TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (_selectedWeight > 0.1) { // Ensure weight is positive
                          _selectedWeight -= 0.1;
                        }
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        _selectedWeight += 0.1;
                      });
                    },
                  ),
                ],
              ),

              // Price
              Text(
                'Price: ₱${(widget.fish.price * _selectedWeight).toStringAsFixed(2)}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18,
                ),
              ),

              // Fish description
              Text(
                widget.fish.description,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),

              Divider(color: Theme.of(context).colorScheme.secondary),
              const SizedBox(height: 10),

              // Title for the add-ons section
              const SizedBox(height: 20),
              Text(
                'Different Preparation Methods',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18,
                ),
              ),

              // Add-ons with border
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: widget.fish.availableAddons.map((addon) {
                    return CheckboxListTile(
                      title: Text(addon.name),
                      subtitle: Text(
                        'Price: ₱${addon.price.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      value: selectedAddons[addon], // Bind to selectedAddons state
                      onChanged: (bool? value) {
                        // Handle checkbox state change
                        setState(() {
                          selectedAddons[addon] = value ?? false;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),

              // Button to add to cart with long press functionality
              Center(
                child: GestureDetector(
                  onLongPress: () {
                    setState(() {
                      _buttonColor = Colors.green; // Change color on long press
                    });
                  },
                  onLongPressUp: () {
                    // Change color back and perform action on release
                    setState(() {
                      _buttonColor = Colors.blue;
                      if (!_isAddedToCart) {
                        addToCart(widget.fish, selectedAddons);
                      }
                    });
                  },
                  child: TweenAnimationBuilder<Color?>(
                    tween: ColorTween(begin: _buttonColor, end: _buttonColor),
                    duration: const Duration(milliseconds: 300),
                    builder: (context, color, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: color, // Text color
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          textStyle: const TextStyle(fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (!_isAddedToCart) {
                            addToCart(widget.fish, selectedAddons);
                          }
                        },
                        child: Text(_isAddedToCart ? 'Added to Cart' : 'Add to Cart'),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
