part of 'shopping_bloc.dart';

@immutable
sealed class ShoppingState
//  extends Equatable
{}

class InitialState extends ShoppingState {
  // @override
  // List<Object?> get props => [];
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
    List<ShoppingItemEntity>? cartItems,
    // double? totalvalue,
  }) {
    return ListFetchingSuccessfullState(
      shoppinglist: shoppinglist ?? this.shoppinglist,
      cartItems: cartItems ?? this.cartItems,
    );
  }

  // @override
  // List<Object?> get props => [
  //       shoppinglist,
  //       cartItems,
  //     ];
}
