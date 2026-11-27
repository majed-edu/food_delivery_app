import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_buttom.dart';
import 'package:food_delivery_app/components/my_cart_tile.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Your Cart'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              // clear cart with showDialog
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Clear Cart'),
                        content: const Text(
                          'Are you sure you want to clear your cart?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              restaurant.clearCart();
                              Navigator.of(context).pop();
                            },
                            child: const Text('Clear'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),

          body: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? Expanded(
                            child: const Center(child: Text('Your cart is empty.')),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                final cartItem = userCart[index];
                                return MyCartTile(cartItem: cartItem);
                              },
                            ),
                      ),
                
                      // checkout button
                       MyButtom(
                        onTap: () {
                          // Add the selected food item and its addons to the cart
                          // addToCart(widget.food, widget.selectedAddons);
                        },
                        text: "Go To Checkout",
                      ),
                      const SizedBox(height: 25),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
