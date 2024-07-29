import 'package:fish_delivery_app/models/fish.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({
    super.key,
    required this.tabController,
  });

  List<Tab> _buildCategoryTabs() {
    return FishCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
        );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return  TabBar(
      controller: tabController,
      tabs: _buildCategoryTabs(),
    );
  }
}