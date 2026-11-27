import 'package:flutter/material.dart';

class MyDescribtionBox extends StatelessWidget {
  const MyDescribtionBox({super.key});

  @override
  Widget build(BuildContext context) {
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
      // fontSize: 16,
    );
    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
      // fontSize: 14,
    );

    return Container(
      decoration: BoxDecoration(
        // color: Theme.of(context).colorScheme.secondary,
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(25.0),
      margin: const EdgeInsets.only(bottom: 25, left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('\$0.99', style: myPrimaryTextStyle),
              Text("Delivery Fee", style: mySecondaryTextStyle),
            ],
          ),

          Column(
            children: [
              Text('30-40 min', style: myPrimaryTextStyle),
              Text("Delivery Time", style: mySecondaryTextStyle),
            ],
          ),
        ],
      ),
    );
  }
}
