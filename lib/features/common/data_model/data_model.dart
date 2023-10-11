// ignore_for_file: annotate_overrides, overridden_fields

import 'package:practice_shopping_app/features/common/entities/shopping_item.dart';

// ignore: must_be_immutable
class ShoppingListModel extends ShoppingItemEntity {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;
  final int itemQuantity;

  const ShoppingListModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.category,
      required this.image,
      this.itemQuantity = 0})
      : super(
          id: id,
          title: title,
          description: description,
          price: price,
          category: category,
          image: image,
          itemQuantity: itemQuantity,
        );

  factory ShoppingListModel.getData(Map<dynamic, dynamic> json) {
    return ShoppingListModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      category: json['category'],
      image: json['image'],
      itemQuantity: json['itemQuantity'] ?? 0,
    );
  }

  Map<String, dynamic> toJSON() {
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
