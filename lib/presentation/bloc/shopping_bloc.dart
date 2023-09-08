import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:practice_shopping_app/domain/entities/shopping_item.dart';
import 'package:practice_shopping_app/domain/repository/shopping_item_fetching.dart';

import '../../domain/repository/local_storage.dart';

part 'shopping_event.dart';
part 'shopping_state.dart';

class ShoppingBloc extends Bloc<ShoppingEvent, ShoppingState> {
  ShoppingBloc() : super(InitialState()) {
    on<ShoppingListFetchEvent>(listfetching);
    on<PlaceOrderEvent>(placeOrder);
    on<AddtoCartEvent>(addToCart);
    on<IncreaseQuantityEvent>(increaseQuantity);
    on<DecreaseQuantityEvent>(decreaseQuantity);
    on<OrderListFetchEvent>(orderListFetching);
  }

  FutureOr<void> listfetching(
      ShoppingListFetchEvent event, Emitter<ShoppingState> emit) async {
    List<ShoppingItemEntity> shoppinglist = await DataRepo().getDatafromDio();
    emit(
      ListFetchingSuccessfullState(
        shoppinglist: shoppinglist,
        cartItems: const [],
        orderLists: const [],
      ),
    );
  }

  FutureOr<void> placeOrder(
      PlaceOrderEvent event, Emitter<ShoppingState> emit) async {
    List<List<ShoppingItemEntity>> orderLists = [...event.orderList];
    List<ShoppingItemEntity> currCart = [...event.currentCart];

    orderLists.insert(0, currCart);
    await LocalStorage().saveOrders(currCart);

    emit(
      (state as ListFetchingSuccessfullState).copyWith(
        orderLists: orderLists,
        cartItems: [],
      ),
    );
  }

  FutureOr<void> addToCart(AddtoCartEvent event, Emitter<ShoppingState> emit) {
    ShoppingItemEntity updatedItem = event.currentItem;

    List<ShoppingItemEntity> copy = [...event.cartList];
    if (copy.isEmpty) {
      copy.add(event.currentItem);
    } else {
      if (containsProduct(copy, updatedItem)) {
        copy[copy.indexWhere((element) => element.id == updatedItem.id)] =
            copy[copy.indexWhere((element) => element.id == updatedItem.id)]
                .copyWith(itemQuantity: updatedItem.itemQuantity);
      } else {
        copy.add(updatedItem);
      }
    }
    emit(
      (state as ListFetchingSuccessfullState).copyWith(
        cartItems: copy,
      ),
    );
  }

  bool containsProduct(
      List<ShoppingItemEntity> list1, ShoppingItemEntity item) {
    Iterable<ShoppingItemEntity> var1 =
        list1.where((element) => element.id == item.id);
    if (var1.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  FutureOr<void> increaseQuantity(
      IncreaseQuantityEvent event, Emitter<ShoppingState> emit) {
    List<ShoppingItemEntity> shoppingListCopy = [...event.shoppingList];
    shoppingListCopy[shoppingListCopy
            .indexWhere((element) => event.currentItem.id == element.id)] =
        shoppingListCopy[shoppingListCopy
                .indexWhere((element) => event.currentItem.id == element.id)]
            .copyWith(
                itemQuantity: shoppingListCopy[shoppingListCopy.indexWhere(
                            (element) => event.currentItem.id == element.id)]
                        .itemQuantity +
                    1);
    emit(
      (state as ListFetchingSuccessfullState)
          .copyWith(shoppinglist: shoppingListCopy),
    );
  }

  FutureOr<void> decreaseQuantity(
      DecreaseQuantityEvent event, Emitter<ShoppingState> emit) {
    List<ShoppingItemEntity> shoppingListCopy = [...event.shoppingList];
    shoppingListCopy[shoppingListCopy.indexWhere(
      (element) => event.currentItem.id == element.id,
    )] = shoppingListCopy[shoppingListCopy
            .indexWhere((element) => event.currentItem.id == element.id)]
        .copyWith(
            itemQuantity: shoppingListCopy[shoppingListCopy.indexWhere(
                        (element) => event.currentItem.id == element.id)]
                    .itemQuantity -
                1);
    emit(
      (state as ListFetchingSuccessfullState)
          .copyWith(shoppinglist: shoppingListCopy),
    );
  }

  FutureOr<void> orderListFetching(
    OrderListFetchEvent event,
    Emitter<ShoppingState> emit,
  ) async {
    List<List<ShoppingItemEntity>> orderListNew =
        await LocalStorage().loadOrder();
    emit(
      (state as ListFetchingSuccessfullState).copyWith(
        orderLists: orderListNew,
      ),
    );
  }
}
