part of 'shopping_bloc.dart';

@immutable
sealed class ShoppingEvent {}

class ShoppingListFetchEvent extends ShoppingEvent {}

class AddtoCartEvent extends ShoppingEvent {
  final ShoppingItemEntity currentItem;
  final List<ShoppingItemEntity> cartList;

  AddtoCartEvent({
    required this.cartList,
    required this.currentItem,
  });
}

class RemoveFromCartEvent extends ShoppingEvent {
  final ShoppingItemEntity currentItem;
  final List<ShoppingItemEntity> cartList;

  RemoveFromCartEvent({required this.currentItem, required this.cartList});
}

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

class PlaceOrderEvent extends ShoppingEvent {
  final List<ShoppingItemEntity> currentCart;
  final List<List<ShoppingItemEntity>> orderList;

  PlaceOrderEvent({required this.currentCart, required this.orderList});
}

class OrderListFetchEvent extends ShoppingEvent {}
