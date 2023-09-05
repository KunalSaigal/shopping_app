part of 'shopping_bloc.dart';

@immutable
sealed class ShoppingState extends Equatable {}

class InitialState extends ShoppingState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ListFetchingSuccessfullState extends ShoppingState {
  final List<ShoppingItemEntity> shoppinglist;
  final List<ShoppingItemEntity> cartItems;

  ListFetchingSuccessfullState({
    required this.cartItems,
    required this.shoppinglist,
  });

  ListFetchingSuccessfullState copyWith({
    List<ShoppingItemEntity>? shoppinglist,
    List<ShoppingItemEntity>? cartItem,
  }) {
    return ListFetchingSuccessfullState(
      shoppinglist: shoppinglist ?? this.shoppinglist,
      cartItems: cartItem ?? cartItems,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [shoppinglist, cartItems];
}

class CartState extends ShoppingState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class OrderPlaced extends CartState {}
