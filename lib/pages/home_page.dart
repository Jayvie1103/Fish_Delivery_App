import 'package:flutter/material.dart';
import 'package:fish_delivery_app/models/fish.dart';
import 'package:fish_delivery_app/components/my_description_box.dart';
import 'package:fish_delivery_app/components/my_fish_tile.dart';
import 'package:fish_delivery_app/components/my_sliver_app_bar.dart';
import 'package:fish_delivery_app/components/my_tab_bar.dart';
import 'package:fish_delivery_app/models/fishmarket.dart';
import 'package:fish_delivery_app/pages/fish_page.dart';
import 'package:fish_delivery_app/components/my_drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Example data for purchased items
  final List<Fish> purchasedItems = [
    Fish(
      name: 'Tampal Puke',
      description: 'Magkaiba kulay nun ang ilalim nun maputi kasi sya naka lapat sa buhangin tapos ang ibabaw maitim',
      imagePath: 'lib/images/tampal_puke.png',
      price: 100.00,
      weight: 1.0,
      category: FishCategory.fish,
      availableAddons: [Addon(name: 'Pang Adobo', price: 10.00)],
    ),
  ];

  final double deliveryFee = 0.99;
  final String deliveryTime = '15-30 min';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: FishCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> getFishInThisCategory(List<Fish> fullMenu) {
    return FishCategory.values.map((category) {
      List<Fish> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final fish = categoryMenu[index];
          return FishTile(
            fish: fish,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FishPage(fish: fish),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  List<Fish> _filterMenuByCategory(FishCategory category, List<Fish> fullMenu) {
    return fullMenu.where((fish) => fish.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 65.0, left: 15.0, right: 15.0, bottom: 10.0),
                  child: MyDescriptionBox(
                    purchasedItems: purchasedItems,
                    deliveryFee: deliveryFee,
                    deliveryTime: deliveryTime,
                  ),
                ),
              ],
            ),
          ),
        ],
        body: Consumer<Fishmarket>(
          builder: (context, fishmarket, child) => TabBarView(
            controller: _tabController,
            children: getFishInThisCategory(fishmarket.menu),
          ),
        ),
      ),
    );
  }
}
