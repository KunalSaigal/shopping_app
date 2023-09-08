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

class IncreaseQuantityEvent extends ShoppingEvent {
  final List<ShoppingItemEntity> shoppingList;
  final ShoppingItemEntity currentItem;

  IncreaseQuantityEvent(
      {required this.shoppingList, required this.currentItem});
}

class DecreaseQuantityEvent extends ShoppingEvent {
  final List<ShoppingItemEntity> shoppingList;
  final ShoppingItemEntity currentItem;

  DecreaseQuantityEvent(
      {required this.currentItem, required this.shoppingList});
}

class PlaceOrderEvent extends ShoppingEvent {
  final List<ShoppingItemEntity> currentCart;
  final List<List<ShoppingItemEntity>> orderList;

  PlaceOrderEvent({required this.currentCart, required this.orderList});
}

class OrderListFetchEvent extends ShoppingEvent {}
