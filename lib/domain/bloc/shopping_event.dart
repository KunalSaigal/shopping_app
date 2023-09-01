part of 'shopping_bloc.dart';

@immutable
sealed class ShoppingEvent {}

class ShoppingListFetchEvent extends ShoppingEvent {}

class AddToCartEvent extends ShoppingEvent {}
