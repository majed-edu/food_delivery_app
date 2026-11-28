import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_drawer_tile.dart';
import 'package:food_delivery_app/pages/cart_page.dart';
import 'package:food_delivery_app/pages/login_page.dart';
import 'package:food_delivery_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),

            child: Icon(
              Icons.fastfood_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),

            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
              // thickness: 1,
            ),
          ),

          MyDrawerTile(
            onTap: () {
              Navigator.pop(context);
            },
            icon: Icons.home,
            title: "H O M E",
          ),
          MyDrawerTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            icon: Icons.person,
            title: "S E T T I N G S",
          ),
          MyDrawerTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
            icon: Icons.shopping_cart,
            title: "C A R T",
          ),

          const Spacer(flex: 1),
          MyDrawerTile(
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(
              // context,
              // MaterialPageRoute(builder: (context) =>  LoginPage()),
              // );
            },
            icon: Icons.logout,
            title: "L O G O U T",
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
