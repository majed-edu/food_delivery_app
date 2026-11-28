import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 25.0,
        left: 25.0,
        right: 25.0,
        top: 50.0,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Thank you for your order!'),
            const SizedBox(height: 25),

            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                  // width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.all(25.0),
              child: Consumer<Restaurant>(
                builder: (context, restaurant, child) {
                  return Text(restaurant.displayCartReceipt());
                },
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Your order is being processed and will be delivered shortly.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
