part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderFetchingState extends OrderState {}

final class OrderFetchingSuccessState extends OrderState {
  final List<List<ShoppingItemEntity>> orderLists;

  const OrderFetchingSuccessState({required this.orderLists});

  OrderFetchingSuccessState copyWith({
    List<List<ShoppingItemEntity>>? orderLists,
  }) {
    return OrderFetchingSuccessState(
      orderLists: orderLists ?? this.orderLists,
    );
  }

  @override
  List<Object> get props => [orderLists];
}

final class OrderErrorState extends OrderState {}
