import 'package:flutter/material.dart';
import 'fish.dart';
import 'cart_item.dart';

class Fishmarket extends ChangeNotifier {
  final List<Fish> _menu = [
    // Fish
    Fish(
      name: "Gulyasan",
      description: "Gulyasan refers to skipjack tuna, a commonly consumed fish in the Philippines known for its firm texture and strong flavor.",
      imagePath: "assets/images/fish/gulyasan.jpg",
      price: 100.0,
      weight: 1,
      category: FishCategory.fish,
      availableAddons: [
        Addon(name: "pang adobo", price: 5),
        Addon(name: "pang prito", price: 5),
        Addon(name: "pang inihaw", price: 5),
      ],
    ),
    Fish(
      name: "Dulong",
      description: "Dulong refers to small, silvery fish also known as anchovy fry or whitebait. They are typically used in Filipino cuisine for dishes like ginisang dulong (sauteed dulong) or tortang dulong (dulong omelette).",
      imagePath: "assets/images/fish/dulong.jpg",
      price: 100.0,
      weight: 1,
      category: FishCategory.fish,
      availableAddons: [
        Addon(name: "pang adobo", price: 5),
        Addon(name: "pang prito", price: 5),
        Addon(name: "pang inihaw", price: 5),
      ],
    ),
    Fish(
      name: "Tamban",
      description: "Tamban refers to the sardine (Sardinella), a small, oily fish commonly found in the Philippines. It is often used in local dishes such as ginisang tamban (sauteed sardines) and paksiw na tamban (sardines in vinegar).",
      imagePath: "assets/images/fish/tamban.jpg",
      price: 100.0,
      weight: 1,
      category: FishCategory.fish,
      availableAddons: [
        Addon(name: "pang adobo", price: 5),
        Addon(name: "pang prito", price: 5),
        Addon(name: "pang inihaw", price: 5),
      ],
    ),
    Fish(
      name: "TampalPuke",
      description: "Tampalpuke refers to the flounder fish, which is a type of flatfish. In the Philippines, it is known for its distinctive flat body and is commonly used in various dishes, such as grilled or fried flounder.",
      imagePath: "assets/images/fish/tampalpuke.jpg",
      price: 100.0,
      weight: 1,
      category: FishCategory.fish,
      availableAddons: [
        Addon(name: "pang adobo", price: 5),
        Addon(name: "pang prito", price: 5),
        Addon(name: "pang inihaw", price: 5),
      ],
    ),
    Fish(
      name: "Tilapia",
      description: "Tilapia is a popular freshwater fish in the Philippines known for its mild flavor and versatility in cooking.",
      imagePath: "assets/images/fish/tilapia.png",
      price: 100.0,
      weight: 1,
      category: FishCategory.fish,
      availableAddons: [
        Addon(name: "pang adobo", price: 5),
        Addon(name: "pang prito", price: 5),
        Addon(name: "pang inihaw", price: 5),
      ],
    ),
    // Crab
    Fish(
      name: "Blue Crab",
      description: "Blue crab (Alimasag) is a type of crab commonly found in the Philippines. It is known for its sweet, tender meat and distinctive blue-tinted shell.",
      imagePath: "assets/images/crab/blue_crab.jpg",
      price: 100.0,
      weight: 1,
      category: FishCategory.crab,
      availableAddons: [
        Addon(name: "linis", price: 2),
      ],
    ),
    Fish(
      name: "Mud Crab",
      description: "Mud crab (Alimasag) is a type of crab commonly found in the Philippines. It is known for its sweet, tender meat and distinctive blue-tinted shell.",
      imagePath: "assets/images/crab/mud_crab.jpg",
      price: 100.0,
      weight: 1,
      category: FishCategory.crab,
      availableAddons: [
        Addon(name: "linis", price: 2),
      ],
    ),
    // Shellfish
    Fish(
      name: "Clams",
      description: "Clams (Halaan) are a type of shellfish commonly found in the Philippines. They are often used in Filipino cuisine in dishes like halaan soup (clam soup), which is typically made with ginger and green onions, or in ginataang halaan (clams in coconut milk).",
      imagePath: "assets/images/shellfish/clams.jpg",
      price: 100.0,
      weight: 1,
      category: FishCategory.shellfish,
      availableAddons: [
        Addon(name: "linis", price: 5),
      ],
    ),
    Fish(
      name: "Mussels",
      description: "Mussels (Tahong) are a type of shellfish commonly found in the Philippines. They are often used in Filipino dishes such as baked tahong (baked mussels), tinolang tahong (mussel soup), and adobong tahong (mussels cooked in soy sauce and vinegar).",
      imagePath: "assets/images/shellfish/mussels.jpg",
      price: 100.0,
      weight: 1,
      category: FishCategory.shellfish,
      availableAddons: [
        Addon(name: "linis", price: 5),
      ],
    ),
    // Shrimp
    Fish(
      name: "Sugpo",
      description: "White shrimp (Sugpo) are a type of shrimp commonly found in the Philippines. They are often used in various Filipino dishes such as halabos na hipon (steamed shrimp), ginataang sugpo (shrimp in coconut milk), and grilled shrimp.",
      imagePath: "assets/images/shrimp/white_shrimp.jpg",
      price: 100.0,
      weight: 1,
      category: FishCategory.shrimp,
      availableAddons: [
        Addon(name: "linis", price: 5),
      ],
    ),
    // Squid
    Fish(
      name: "PusitBisaya",
      description: "Pusit Bisaya refers to a type of small squid commonly found in the Philippines. It is often used in local dishes such as adobong pusit (squid cooked in soy sauce and vinegar), grilled pusit (inihaw na pusit), and ginataang pusit (squid in coconut milk).",
      imagePath: "assets/images/squid/pusit_bisaya.jpg",
      price: 100.0,
      weight: 1,
      category: FishCategory.squid,
      availableAddons: [
        Addon(name: "linis", price: 5),
      ],
    ),
    Fish(
      name: "PusitDaga",
      description: "Pusit Daga refers to a larger type of squid, commonly known as the Giant Squid or Bigfin Reef Squid in the Philippines.",
      imagePath: "assets/images/squid/pusit_daga.jpg",
      price: 100.0,
      weight: 1,
      category: FishCategory.squid,
      availableAddons: [
        Addon(name: "linis", price: 5),
      ],
    ),
  ];

  final List<CartItem> _userCart = [];

  // Get all available fish items
  List<Fish> get menu => _menu;
  List<CartItem> get cart => _userCart;

  // Get items in the user's cart
  List<CartItem> get userCart => _userCart;

  get purchasedItems => null;

  get deliveryTime => null;

  get deliveryFee => null;

  // Add an item to the cart
  void addItemToCart(Fish fish, int quantity, List<Addon> addons) {
    _userCart.add(CartItem(fish: fish, quantity: quantity, selectedAddons: addons));
    notifyListeners();
  }

  // Remove an item from the cart
  void removeItemFromCart(CartItem cartItem) {
    _userCart.remove(cartItem);
    notifyListeners();
  }

  // Clear the cart
  void clearCart() {
    _userCart.clear();
    notifyListeners();
  }

  // Calculate the total price of the cart
  double get totalPrice {
    double total = 0.0;
    for (var cartItem in _userCart) {
      total += cartItem.totalPrice;
    }
    return total;
  }

  void incrementQuantity(CartItem cartItem) {
    cartItem.quantity++;
    notifyListeners();
  }

  void decrementQuantity(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
      notifyListeners();
    }
  }
}





