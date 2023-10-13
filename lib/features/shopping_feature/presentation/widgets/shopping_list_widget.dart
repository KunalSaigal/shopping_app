import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/shopping_bloc.dart';
import 'product_tile_widget.dart';

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
          return ListView.builder(
            itemCount: state.shoppinglist.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(3),
                child: ProductTileWidget(
                  shoppingListModel: state.shoppinglist[index],
                  cartList: state.cartItems,
                  shoppingList: state.shoppinglist,
                ),
              );
            },
          );
        } else if (state is ListFetchingFailureState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.errorMessage, textAlign: TextAlign.center),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "An unexpected Error has Occured Please Check your Internet Connection",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
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
