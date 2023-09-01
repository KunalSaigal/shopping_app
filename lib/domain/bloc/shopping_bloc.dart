import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practice_shopping_app/data/data_model/data_model.dart';
import 'package:practice_shopping_app/domain/repository/shopping_item_fetching.dart';

import '../../data/item_lists.dart';

part 'shopping_event.dart';
part 'shopping_state.dart';

class ShoppingBloc extends Bloc<ShoppingEvent, ShoppingState> {
  ShoppingBloc() : super(ListFetchingState()) {
    on<ShoppingListFetchEvent>(listfetching);
    on<AddToCartEvent>(addtocart);
  }

  FutureOr<void> listfetching(
      ShoppingListFetchEvent event, Emitter<ShoppingState> emit) async {
    List<ShoppingListModel> shoppinglist = await DataRepo().getDatafromDio();
    // print(shoppinglist);
    emit(ListFetchingSuccessfullState(shoppinglist: shoppinglist));
  }

  FutureOr<void> addtocart(
      AddToCartEvent event, Emitter<ShoppingState> emit) async {
    previous_orders.add(cartItems);
    cartItems.clear();
    List<ShoppingListModel> shoppinglist = await DataRepo().getDatafromDio();
    emit(ListFetchingSuccessfullState(shoppinglist: shoppinglist));
  }
}
