import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({super.key, required this.child, required this.title});

  final Widget child;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 340.0,
      collapsedHeight: 120.0,
      floating: false,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          },
          icon: Icon(
            Icons.shopping_cart,
            // color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(
        'Sunset Dinner',
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,

        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, top: 0, right: 0),
        expandedTitleScale: 1.0,
      ),
    );
  }
}
