part of 'shopping_bloc.dart';

@immutable
sealed class ShoppingEvent {}

class ShoppingListFetchEvent extends ShoppingEvent {}

class IncreaseQuantityEvent extends ShoppingEvent {
  final List<ShoppingItemEntity> shoppingList;
  final ShoppingItemEntity currentItem;
  final List<ShoppingItemEntity> cartList;

  IncreaseQuantityEvent(
      {required this.shoppingList,
      required this.currentItem,
      required this.cartList});
}

class DecreaseQuantityEvent extends ShoppingEvent {
  final List<ShoppingItemEntity> shoppingList;
  final ShoppingItemEntity currentItem;
  final List<ShoppingItemEntity> cartList;

  DecreaseQuantityEvent(
      {required this.currentItem,
      required this.shoppingList,
      required this.cartList});
}

class AddtoCartEvent extends ShoppingEvent {
  final ShoppingItemEntity currentItem;
  final List<ShoppingItemEntity> cartList;

  AddtoCartEvent({
    required this.cartList,
    required this.currentItem,
  });
}
