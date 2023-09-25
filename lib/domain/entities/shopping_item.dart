import 'package:equatable/equatable.dart';
import 'package:practice_shopping_app/data/data_model/data_model.dart';

class ShoppingItemEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;
  final int itemQuantity;

  const ShoppingItemEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    required this.itemQuantity,
  });

  ShoppingItemEntity copyWith({
    int? id,
    String? title,
    String? description,
    double? price,
    String? category,
    String? image,
    int? itemQuantity,
  }) {
    return ShoppingItemEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
      image: image ?? this.image,
      itemQuantity: itemQuantity ?? this.itemQuantity,
    );
  }

  ShoppingListModel toModel() {
    return ShoppingListModel(
      id: id,
      title: title,
      category: category,
      description: description,
      image: image,
      itemQuantity: itemQuantity,
      price: price,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      price,
      category,
      image,
      itemQuantity,
    ];
  }
}
