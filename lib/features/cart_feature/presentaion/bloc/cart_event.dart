part of 'cart_bloc.dart';

sealed class CartEvent
// extends Equatable
{
  const CartEvent();

  // @override
  // List<Object> get props => [];
}

class RemoveFromCartEvent extends CartEvent {
  final ShoppingItemEntity currentItem;

  const RemoveFromCartEvent({required this.currentItem});
}

class PlaceOrderEvent extends CartEvent {
  final List<List<ShoppingItemEntity>> orderList;

  const PlaceOrderEvent({required this.orderList});
}

class CartFetchEvent extends CartEvent {}
