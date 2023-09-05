import 'package:practice_shopping_app/domain/entities/shopping_item.dart';

// ignore: must_be_immutable
class ShoppingListModel extends ShoppingItemEntity {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;
  final int itemQuantity;

  const ShoppingListModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    this.itemQuantity = 1,
  }) : super(
          id: id,
          title: title,
          description: description,
          price: price,
          category: category,
          image: image,
        );

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
