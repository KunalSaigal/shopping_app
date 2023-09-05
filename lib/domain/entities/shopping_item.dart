import 'package:equatable/equatable.dart';

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
    this.itemQuantity = 1,
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

  @override
  // TODO: implement props
  List<Object?> get props {
    return [id, title, description, price, category, image, itemQuantity];
  }
}
