import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key, required this.tabController});

  final TabController tabController;

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last, // Get the name of the enum value

      );
    }).toList();
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(left: 25, right: 25),
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTabs(),
        // isScrollable: true,
      ),
    );
  }
}
