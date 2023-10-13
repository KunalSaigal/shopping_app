import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/entities/shopping_item.dart';
import '../../domain/use_case/local_data_usecase.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final LocalDataUseCase localDataUseCase;
  OrderBloc({required this.localDataUseCase}) : super(OrderFetchingState()) {
    on<FetchOrderListEvent>(orderListFetching);
  }

  FutureOr<void> orderListFetching(
    FetchOrderListEvent event,
    Emitter<OrderState> emit,
  ) async {
    List<List<ShoppingItemEntity>> orderListNew =
        await localDataUseCase.loadOrder();
    emit(
      OrderFetchingSuccessState(orderLists: orderListNew),
    );
  }
}
