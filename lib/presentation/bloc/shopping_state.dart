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
  final double totalvalue;

  ListFetchingSuccessfullState({
    this.totalvalue = 0,
    required this.orderLists,
    required this.cartItems,
    required this.shoppinglist,
  });

  ListFetchingSuccessfullState copyWith({
    List<ShoppingItemEntity>? shoppinglist,
    List<ShoppingItemEntity>? cartItems,
    List<List<ShoppingItemEntity>>? orderLists,
    double? totalvalue,
  }) {
    return ListFetchingSuccessfullState(
        shoppinglist: shoppinglist ?? this.shoppinglist,
        cartItems: cartItems ?? this.cartItems,
        orderLists: orderLists ?? this.orderLists,
        totalvalue: totalvalue ?? this.totalvalue);
  }

  @override
  List<Object?> get props => [shoppinglist, cartItems, orderLists, totalvalue];
}

class CartState extends ShoppingState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
