import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_buttom.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  FoodPage({super.key, required this.food}) {
    // Initialize the selectedAddons map with all available addons set to false
    for (var addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  final Food food;
  final Map<FoodAddon, bool> selectedAddons = {};

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  // method to add to cart
  void addToCart(Food food, Map<FoodAddon, bool> selectedAddons) {
    // close the food page
    Navigator.pop(context);
    // Get the selected addons
    List<FoodAddon> currentlySelectedAddons = [];
    for (FoodAddon addon in widget.food.availableAddons) {
      if (selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    // Add the CartItem to the restaurant's cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Display food image
                Image.network(
                  widget.food.imageUrl,
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                ),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      // Display food name
                      Text(
                        widget.food.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Display food price
                      Text(
                        '\$${widget.food.price.toString()}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Display food description
                      Text(
                        widget.food.description,
                        style: TextStyle(
                          // color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                        // thickness: 1,
                      ),

                      // Display available addons
                      Text(
                        'Available Addons:',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            // get individual addon
                            final addon = widget.food.availableAddons[index];

                            // return checkbox list tile for each addon
                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text(
                                '\$${addon.price.toString()}',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14,
                                ),
                              ),

                              value: widget.selectedAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon] = value ?? false;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // Add to Cart button
                MyButtom(
                  onTap: () {
                    // Add the selected food item and its addons to the cart
                    addToCart(widget.food, widget.selectedAddons);
                  },
                  text: "Add to Cart",
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),

        // Back button
        Positioned(
          top: 40,
          left: 20,
          child: Opacity(
            opacity: 0.6,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
