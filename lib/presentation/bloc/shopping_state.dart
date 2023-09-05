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
  final List<List<ShoppingItemEntity>> orderLists;

  ListFetchingSuccessfullState({
    required this.orderLists,
    required this.cartItems,
    required this.shoppinglist,
  });

  ListFetchingSuccessfullState copyWith({
    List<ShoppingItemEntity>? shoppinglist,
    List<ShoppingItemEntity>? cartItem,
    List<List<ShoppingItemEntity>>? orderList,
  }) {
    return ListFetchingSuccessfullState(
      shoppinglist: shoppinglist ?? this.shoppinglist,
      cartItems: cartItem ?? cartItems,
      orderLists: orderList ?? orderLists,
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
