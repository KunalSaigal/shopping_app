import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_shopping_app/features/common/entities/shopping_item.dart';
import 'package:practice_shopping_app/features/fetch_order/domain/use_case/local_data_usecase.dart';
import 'package:practice_shopping_app/features/fetch_shopping_list/presentation/bloc/shopping_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ShoppingBloc shoppingBloc;
  late StreamSubscription streamSubscription;
  List<ShoppingItemEntity> updatedCart = [];

  CartBloc(this.shoppingBloc, {required this.localDataUseCase})
      : super(CartInitialState()) {
    streamSubscription = shoppingBloc.stream.listen(
      (state) {
        if (state is ListFetchingSuccessfullState) {
          updatedCart = state.cartItems;
          add(CartFetchEvent());
          // print(updatedCart);
        }
      },
    );
    on<CartFetchEvent>(cartfetch);
    on<RemoveFromCartEvent>(removeFromCart);
    on<PlaceOrderEvent>(placeOrder);
  }
  final LocalDataUseCase localDataUseCase;

  FutureOr<void> removeFromCart(
      RemoveFromCartEvent event, Emitter<CartState> emit) {
    ShoppingItemEntity updatedItem = event.currentItem;
    List<ShoppingItemEntity> copy = [...updatedCart];
    copy.remove(
      copy[copy.indexWhere((element) => element.id == updatedItem.id)],
    );
    emit(
      (state as CartFetchingSucessState).copyWith(
        cartList: copy,
        totalvalue: ((state as CartFetchingSucessState).totalvalue -
            updatedItem.price * updatedItem.itemQuantity),
      ),
    );
  }

  FutureOr<void> placeOrder(
      PlaceOrderEvent event, Emitter<CartState> emit) async {
    List<List<ShoppingItemEntity>> orderLists = [...event.orderList];
    List<ShoppingItemEntity> currCart = [...updatedCart];

    orderLists.insert(0, currCart);
    await localDataUseCase.saveOrders(currCart);
    emit(
      (state as CartFetchingSucessState).copyWith(
        cartList: [],
        totalvalue: 0,
      ),
    );
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }

  FutureOr<void> cartfetch(CartFetchEvent event, Emitter<CartState> emit) {
    emit(CartFetchingSucessState(cartList: updatedCart));
  }
}
