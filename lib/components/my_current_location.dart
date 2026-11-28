import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox (BuildContext context) {
    showDialog(context: context, 
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Search Location"),
        content: TextField(
          decoration: InputDecoration(
            hintText: "Enter a location",
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Save"),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          Text(
            "Deliver Now",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
      
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Text(
                  "9600 Hollywood Blvd",
                  style: TextStyle(
                    // fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  // size: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
