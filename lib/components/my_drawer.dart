import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_drawer_tile.dart';
import 'package:food_delivery_app/pages/cart_page.dart';
import 'package:food_delivery_app/pages/login_page.dart';
import 'package:food_delivery_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  // Method to log out the user
  Future<void> logout(BuildContext context) async {
    // Show a confirmation dialog before logging out
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (shouldLogout == true) {
      // Perform logout logic here
      // For example, you can call FirebaseAuth.instance.signOut() if using Firebase Authentication

      // Navigate to the login page after logging out
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage(onTap: () {})),
      );
    }
  }

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
              logout(context);
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
