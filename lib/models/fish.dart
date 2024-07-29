class Fish {
  final String name; //tampal puke
  final String description; // magkaiba kulay nun ang ilalim nun maputi kasi sya naka lapat sa buhangin tapos ang ibabaw maitim
  final String imagePath; // lib/images/tampal_puke.png
  final double price; // 100.00
  final double weight; // 1 kilo
  final FishCategory category; // fish
  List<Addon> availableAddons; // [pang adobo,pang prito,pang inihaw]


Fish({
  required this.name,
  required this.description,
  required this.imagePath,
  required this.price,
  required this.weight,
  required this.category,
  required this.availableAddons,
});
}

// fish categories
enum FishCategory {
   fish,
   crab,
   squid,
   shrimp,
   shellfish,
   
}

// fish addons
class Addon {
  String name;
  double price;
  double weight;

  Addon({required this.name, required this.price, this.weight = 0.0});
}