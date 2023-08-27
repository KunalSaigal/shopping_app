class ShoppingListModel {
  int id;
  String title;
  double price;
  String description;
  Category category;
  String image;
  Rating rating;

  ShoppingListModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ShoppingListModel.getData(Map<dynamic, dynamic> json) {
    return ShoppingListModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: json["rating"]);
  }
}

enum Category { ELECTRONICS, JEWELERY, MEN_S_CLOTHING, WOMEN_S_CLOTHING }

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });
}
