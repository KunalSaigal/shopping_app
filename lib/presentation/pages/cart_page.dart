import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_shopping_app/domain/entities/shopping_item.dart';
import 'package:practice_shopping_app/presentation/bloc/shopping_bloc.dart';
import 'package:practice_shopping_app/presentation/widgets/cart_tile.dart';

class CartPage extends StatelessWidget {
  final List<ShoppingItemEntity> cartItemInstance;
  const CartPage({super.key, required this.cartItemInstance});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Your Cart",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: BlocBuilder<ShoppingBloc, ShoppingState>(
            // buildWhen: (previous, current) => current is OrderPlaced,
            builder: (context, state) {
              return ListView.builder(
                itemCount: cartItemInstance.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CartTile(cartitem: cartItemInstance[index]),
                  );
                },
              );
            },
          ),

          // BlocBuilder<ShoppingBloc, ShoppingState>(
          //     bloc: ShoppingBloc(),
          //     // buildWhen: (previous, current) => current is! ListFetchingState,
          //     builder: (context, state) {
          //       if (state is ListFetchingSuccessfullState) {
          //         final successState = state;
          //         return ListView.builder(
          //           itemCount: successState.shoppinglist.length,
          //           itemBuilder: (context, index) {
          //             return ProductTile(
          //               bloc: ShoppingBloc(),
          //               shoppingListModel: successState.shoppinglist[index],
          //             );
          //           },
          //         );
          //       } else {
          //         return const Center(child: CircularProgressIndicator());
          //       }
          //     }),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(15),
        width: 400,
        child: ElevatedButton(
          onPressed: () {
            BlocProvider.of<ShoppingBloc>(context).add(
              PlaceOrderEvent(currentCart: cartItemInstance),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            padding:
                const EdgeInsets.symmetric(horizontal: 20), // Adjust padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Adjust border radius
            ),
          ),
          child: const Text(
            "Add",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
