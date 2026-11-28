// food items
class Food {
	final String name;
	final String description;
	final double price;
	final String imageUrl;
  final FoodCategory category;
  final List<FoodAddon> availableAddons ;

	 Food({
		required this.name,
		required this.description,
		required this.price,
		required this.imageUrl,
    required this.category,
    required this.availableAddons,
	});
}


// food categories
enum FoodCategory {
	burger,
  sides,
	pizza,
	salad,
	dessert,
	drink,
}

// food Addons
class FoodAddon {
	final String name;
	final double price;

	const FoodAddon({
		required this.name,
		required this.price,
	});
}