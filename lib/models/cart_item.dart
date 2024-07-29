import 'package:fish_delivery_app/models/fish.dart';


class CartItem {
  Fish fish;
  List<Addon> selectedAddons;
  int quantity;

  CartItem({
    required this.fish,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get totalPrice {
    double addonsPrice = selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (fish.price + addonsPrice) * quantity;
  }
}
