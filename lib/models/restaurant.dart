import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu

  final List<Food> _menu = [
    // #region Burgers
    Food(
      name: 'Classic Cheeseburger',

      description:
          'Juicy beef patty with cheddar cheese, lettuce, tomato, and our special sauce.',

      price: 8.99,

      imageUrl:
          'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.burger,

      availableAddons: [
        FoodAddon(name: 'Extra Cheese', price: 1.00),

        FoodAddon(name: 'Bacon', price: 1.50),

        FoodAddon(name: 'Lettuce', price: 0.50),
      ],
    ),

    Food(
      name: 'Bacon Burger',

      description:
          'Grilled beef patty topped with crispy bacon, cheddar cheese, and BBQ sauce.',

      price: 9.99,

      imageUrl:
          'https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.burger,

      availableAddons: [
        FoodAddon(name: 'Extra Bacon', price: 1.50),

        FoodAddon(name: 'Avocado', price: 1.00),

        FoodAddon(name: 'Onion Rings', price: 1.00),
      ],
    ),

    Food(
      name: 'Mushroom Swiss Burger',

      description: 'Beef patty topped with sautéed mushrooms and Swiss cheese.',

      price: 10.49,

      imageUrl:
          'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.burger,

      availableAddons: [
        FoodAddon(name: 'Extra Swiss', price: 1.00),

        FoodAddon(name: 'Caramelized Onions', price: 0.75),
      ],
    ),

    Food(
      name: 'Crispy Chicken Burger',

      description: 'Crispy chicken breast with lettuce and creamy mayo.',

      price: 9.49,

      imageUrl:
          'https://images.unsplash.com/photo-1606755962773-d324e0a13086?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.burger,

      availableAddons: [
        FoodAddon(name: 'Extra Pickles', price: 0.50),

        FoodAddon(name: 'Cheddar', price: 1.00),
      ],
    ),

    Food(
      name: 'Veggie Burger',

      description: 'Seasoned veggie patty with fresh tomato and avocado.',

      price: 8.49,

      imageUrl:
          'https://images.unsplash.com/photo-1520072959219-c595dc870360?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.burger,

      availableAddons: [
        FoodAddon(name: 'Avocado', price: 1.00),

        FoodAddon(name: 'Vegan Cheese', price: 1.00),
      ],
    ),

    // #endregion

    // #region Sides
    Food(
      name: 'French Fries',

      description: 'Crispy golden fries served with ketchup.',

      price: 3.99,

      imageUrl:
          'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.sides,

      availableAddons: [
        FoodAddon(name: 'Cheese Sauce', price: 0.99),

        FoodAddon(name: 'Chili', price: 1.50),

        FoodAddon(name: 'Garlic Aioli', price: 0.75),
      ],
    ),

    Food(
      name: 'Onion Rings',

      description: 'Crispy battered onion rings served with ranch dip.',

      price: 4.99,

      imageUrl:
          'https://images.unsplash.com/photo-1645066804048-080d5fe87ae3?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.sides,

      availableAddons: [
        FoodAddon(name: 'Spicy Mayo', price: 0.75),

        FoodAddon(name: 'BBQ Sauce', price: 0.50),

        FoodAddon(name: 'Cheese Dip', price: 1.00),
      ],
    ),

    Food(
      name: 'Mozzarella Sticks',

      description: 'Golden fried mozzarella served with marinara sauce.',

      price: 5.49,

      imageUrl:
          'https://images.unsplash.com/photo-1531749668029-2db88e4276c7?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.sides,

      availableAddons: [FoodAddon(name: 'Extra Marinara', price: 0.50)],
    ),

    Food(
      name: 'Loaded Potato Wedges',

      description: 'Seasoned potato wedges topped with cheese and herbs.',

      price: 5.99,

      imageUrl:
          'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.sides,

      availableAddons: [
        FoodAddon(name: 'Sour Cream', price: 0.75),

        FoodAddon(name: 'Bacon Bits', price: 1.00),
      ],
    ),

    Food(
      name: 'Garden Side Salad',

      description: 'Fresh greens, cucumber, tomato, and house dressing.',

      price: 4.49,

      imageUrl:
          'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.sides,

      availableAddons: [FoodAddon(name: 'Feta Cheese', price: 0.75)],
    ),

    // #endregion

    // #region Pizza
    Food(
      name: 'Margherita Pizza',

      description: 'Tomato, mozzarella, and fresh basil on a crisp crust.',

      price: 12.99,

      imageUrl:
          'https://images.unsplash.com/photo-1579751626657-72bc17010498?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.pizza,

      availableAddons: [FoodAddon(name: 'Extra Mozzarella', price: 1.50)],
    ),

    Food(
      name: 'Pepperoni Pizza',

      description: 'Classic pizza topped with pepperoni and mozzarella.',

      price: 14.99,

      imageUrl:
          'https://images.unsplash.com/photo-1628840042765-356cda07504e?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.pizza,

      availableAddons: [FoodAddon(name: 'Extra Pepperoni', price: 1.50)],
    ),

    Food(
      name: 'BBQ Chicken Pizza',

      description: 'Grilled chicken, BBQ sauce, red onion, and cheese.',

      price: 15.99,

      imageUrl:
          'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.pizza,

      availableAddons: [FoodAddon(name: 'Jalapeños', price: 0.75)],
    ),

    Food(
      name: 'Four Cheese Pizza',

      description:
          'A rich blend of mozzarella, cheddar, parmesan, and blue cheese.',

      price: 15.49,

      imageUrl:
          'https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.pizza,

      availableAddons: [FoodAddon(name: 'Chili Flakes', price: 0.25)],
    ),

    Food(
      name: 'Veggie Supreme Pizza',

      description: 'Bell peppers, olives, mushrooms, and red onion.',

      price: 13.99,

      imageUrl:
          'https://images.unsplash.com/photo-1593560708920-61dd98c46a4e?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.pizza,

      availableAddons: [FoodAddon(name: 'Extra Olives', price: 0.75)],
    ),

    // #endregion

    // #region Salads
    Food(
      name: 'Classic Caesar Salad',

      description: 'Crisp romaine, parmesan, croutons, and Caesar dressing.',

      price: 8.99,

      imageUrl:
          'https://images.unsplash.com/photo-1546793665-c74683f339c1?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.salad,

      availableAddons: [FoodAddon(name: 'Grilled Chicken', price: 2.50)],
    ),

    Food(
      name: 'Greek Salad',

      description: 'Tomato, cucumber, olives, red onion, and feta cheese.',

      price: 9.49,

      imageUrl:
          'https://images.unsplash.com/photo-1490645935967-10de6ba17061?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.salad,

      availableAddons: [FoodAddon(name: 'Extra Feta', price: 1.00)],
    ),

    Food(
      name: 'Avocado Garden Salad',

      description: 'Mixed greens with avocado, tomato, cucumber, and seeds.',

      price: 10.49,

      imageUrl:
          'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.salad,

      availableAddons: [FoodAddon(name: 'Lemon Dressing', price: 0.50)],
    ),

    Food(
      name: 'Quinoa Power Salad',

      description:
          'Quinoa, leafy greens, roasted vegetables, and citrus dressing.',

      price: 10.99,

      imageUrl:
          'https://images.unsplash.com/photo-1511690743698-d9d85f2fbf38?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.salad,

      availableAddons: [FoodAddon(name: 'Grilled Chicken', price: 2.50)],
    ),

    Food(
      name: 'Strawberry Spinach Salad',

      description: 'Baby spinach, strawberries, walnuts, and feta.',

      price: 9.99,

      imageUrl:
          'https://images.unsplash.com/photo-1490645935967-10de6ba17061?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.salad,

      availableAddons: [FoodAddon(name: 'Balsamic Dressing', price: 0.50)],
    ),

    // #endregion

    // #region Desserts
    Food(
      name: 'Chocolate Cake',

      description:
          'Moist chocolate cake finished with rich chocolate frosting.',

      price: 6.49,

      imageUrl:
          'https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.dessert,

      availableAddons: [FoodAddon(name: 'Vanilla Ice Cream', price: 1.50)],
    ),

    Food(
      name: 'New York Cheesecake',

      description: 'Creamy cheesecake with a buttery biscuit base.',

      price: 6.99,

      imageUrl:
          'https://images.unsplash.com/photo-1533134242443-d4fd215305ad?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.dessert,

      availableAddons: [FoodAddon(name: 'Berry Compote', price: 0.75)],
    ),

    Food(
      name: 'Apple Pie',

      description: 'Warm spiced apples baked in a flaky golden crust.',

      price: 5.99,

      imageUrl:
          'https://images.unsplash.com/photo-1535920527002-b35e96722eb9?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.dessert,

      availableAddons: [FoodAddon(name: 'Whipped Cream', price: 0.75)],
    ),

    Food(
      name: 'Tiramisu',

      description: 'Espresso-soaked layers with mascarpone cream and cocoa.',

      price: 6.99,

      imageUrl:
          'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.dessert,

      availableAddons: [FoodAddon(name: 'Extra Cocoa', price: 0.25)],
    ),

    Food(
      name: 'Chocolate Brownie',

      description: 'Fudgy chocolate brownie with a crisp top.',

      price: 4.99,

      imageUrl:
          'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.dessert,

      availableAddons: [FoodAddon(name: 'Vanilla Ice Cream', price: 1.50)],
    ),

    // #endregion

    // #region Drinks
    Food(
      name: 'Fresh Lemonade',

      description: 'Refreshing lemon juice served chilled.',

      price: 3.49,

      imageUrl:
          'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.drink,

      availableAddons: [FoodAddon(name: 'Mint', price: 0.50)],
    ),

    Food(
      name: 'Iced Coffee',

      description: 'Smooth cold-brew coffee poured over ice.',

      price: 4.49,

      imageUrl:
          'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.drink,

      availableAddons: [FoodAddon(name: 'Vanilla Syrup', price: 0.50)],
    ),

    Food(
      name: 'Strawberry Smoothie',

      description: 'Blended strawberries and yogurt for a fruity treat.',

      price: 5.49,

      imageUrl:
          'https://images.unsplash.com/photo-1505252585461-04db1eb84625?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.drink,

      availableAddons: [FoodAddon(name: 'Protein Boost', price: 1.00)],
    ),

    Food(
      name: 'Iced Tea',

      description: 'Freshly brewed black tea served over ice.',

      price: 2.99,

      imageUrl:
          'https://images.unsplash.com/photo-1556679343-c7306c1976bc?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.drink,

      availableAddons: [FoodAddon(name: 'Lemon Slice', price: 0.25)],
    ),

    Food(
      name: 'Orange Juice',

      description: 'Chilled juice made from sweet oranges.',

      price: 3.99,

      imageUrl:
          'https://images.unsplash.com/photo-1600271886742-f049cd451bba?auto=format&fit=crop&w=800&q=80',

      category: FoodCategory.drink,

      availableAddons: [FoodAddon(name: 'Extra Ice', price: 0.00)],
    ),
  ];

  // Getters
  // - Get the restaurant menu.
  List<Food> get menu => _menu;
  // - Get the current cart items.
  List<CartItem> get cart => _cart;

  /*
  Cart operations can be added here:
  */

  // - Get the current cart items.
  final List<CartItem> _cart = [];

  // - Add an item to the cart.
  void addToCart(Food food, List<FoodAddon> selectedAddons) {
    // see if the food item with the same addons already exists in the cart
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // Check if the food item is the same and if the selected addons match
      return item.food.name == food.name &&
          ListEquality().equals(item.selectedAddons, selectedAddons);
    });

    // If it exists, increase the quantity; otherwise, add a new item to the cart.
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }

    notifyListeners();
  }

  // - Remove an item from the cart.
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    // If the item exists in the cart, remove it.
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
      notifyListeners();
    }
  }

  // - Calculate the cart total.
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (FoodAddon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // - Get the current cart items.
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // - Clear the cart.
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // Helper methods can be added here:
  // - Generate the receipt.
  String displayCartReceipt() {
    final receiptBuffer = StringBuffer();
    receiptBuffer.writeln('Here is your receipt:');
    receiptBuffer.writeln('');
    // format the date to include the seconds only
    String formattedDate = DateFormat(
      'yyyy-MM-dd HH:mm:ss',
    ).format(DateTime.now());
    receiptBuffer.writeln('Date: $formattedDate');
    receiptBuffer.writeln();
    receiptBuffer.writeln('________________________________________');

    for (CartItem cartItem in _cart) {
      receiptBuffer.writeln(
        '${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}',
      );
      if (cartItem.selectedAddons.isNotEmpty) {
        receiptBuffer.writeln(
          '  Addons: ${_formatAddons(cartItem.selectedAddons)}',
        );
      }
      receiptBuffer.writeln();
    }

    receiptBuffer.writeln('________________________________________');
    receiptBuffer.writeln();
    receiptBuffer.writeln('Total Items: ${getTotalItemCount()}');
    receiptBuffer.writeln('Total Price: ${_formatPrice(getTotalPrice())}');
    receiptBuffer.writeln('');

    return receiptBuffer.toString();
  }

  // - Format Price values.
  String _formatPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }

  // - Format list of selected addons for display.
  String _formatAddons(List<FoodAddon> addons) {
    if (addons.isEmpty) {
      return 'No addons selected';
    }
    return addons
        .map((addon) => '${addon.name} (${_formatPrice(addon.price)})')
        .join(', ');
  }
}
