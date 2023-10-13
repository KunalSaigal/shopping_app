part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitialState extends CartState {}

final class CartFetchingSucessState extends CartState {
  final List<ShoppingItemEntity> cartList;
  final double totalvalue;

  const CartFetchingSucessState({this.totalvalue = 0, required this.cartList});

  CartFetchingSucessState copyWith({
    List<ShoppingItemEntity>? cartList,
    double? totalvalue,
  }) {
    return CartFetchingSucessState(
      totalvalue: totalvalue ?? this.totalvalue,
      cartList: cartList ?? this.cartList,
    );
  }

  @override
  List<Object> get props => [cartList, totalvalue];
}

final class CartListErrorState extends CartState {}
