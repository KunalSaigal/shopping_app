import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state_management/bloc/shopping_bloc.dart';
import 'product_tile.dart';

class ShoppingListItems extends StatelessWidget {
  const ShoppingListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingBloc, ShoppingState>(
      builder: (context, state) {
        if (state is InitialState) {
          BlocProvider.of<ShoppingBloc>(context).add(ShoppingListFetchEvent());
        }
        if (state is ListFetchingSuccessfullState) {
          final successState = state;
          return ListView.builder(
            itemCount: successState.shoppinglist.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(3),
                child: ProductTile(
                  shoppingListModel: successState.shoppinglist[index],
                  cartList: state.cartItems,
                  shoppingList: state.shoppinglist,
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
