class ShoppingListModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;
  final int itemQuantity;

  ShoppingListModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.category,
      required this.image,
      this.itemQuantity = 0});

  factory ShoppingListModel.getData(Map<dynamic, dynamic> json) {
    return ShoppingListModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      category: json['category'],
      image: json['image'],
    );
  }

  Map<dynamic, dynamic> setData() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'image': image,
      'itemQuantity': itemQuantity
    };
  }
}
