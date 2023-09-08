part of 'shopping_bloc.dart';

@immutable
sealed class ShoppingState extends Equatable {}

class InitialState extends ShoppingState {
  @override
  List<Object?> get props => [];
}

class ListFetchingSuccessfullState extends ShoppingState {
  final List<ShoppingItemEntity> shoppinglist;
  final List<ShoppingItemEntity> cartItems;
  final List<List<ShoppingItemEntity>> orderLists;

  ListFetchingSuccessfullState({
    required this.orderLists,
    required this.cartItems,
    required this.shoppinglist,
  });

  ListFetchingSuccessfullState copyWith({
    List<ShoppingItemEntity>? shoppinglist,
    List<ShoppingItemEntity>? cartItems,
    List<List<ShoppingItemEntity>>? orderLists,
  }) {
    return ListFetchingSuccessfullState(
      shoppinglist: shoppinglist ?? this.shoppinglist,
      cartItems: cartItems ?? this.cartItems,
      orderLists: orderLists ?? this.orderLists,
    );
  }

  @override
  List<Object?> get props => [shoppinglist, cartItems, orderLists];
}

class CartState extends ShoppingState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
