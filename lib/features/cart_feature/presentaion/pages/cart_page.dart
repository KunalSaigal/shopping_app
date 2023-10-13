import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_shopping_app/core/constants/string_constants.dart';
import 'package:practice_shopping_app/features/common/widgets/cart_tile_widget.dart';

import '../bloc/cart_bloc.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            StringConstants.cartPageHeaderText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartInitialState) {
                BlocProvider.of<CartBloc>(context).add(
                  CartFetchEvent(),
                );
                return const CircularProgressIndicator();
              }
              if (state is CartFetchingSucessState) {
                if (state.cartList.isNotEmpty) {
                  return ListView.builder(
                    itemCount: state.cartList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CartTileWidget(
                          cartitem: state.cartList[index],
                          cartList: state.cartList,
                          cartPage: true,
                        ),
                      );
                    },
                  );
                } else {
                  return const Text("StringConstants.emptyCartText");
                }
              } else {
                return const Text(StringConstants.emptyCartText);
              }
            },
          ),
        ),
      ),
      persistentFooterButtons: [
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.04,
        //   child: BlocBuilder<ShoppingBloc, ShoppingState>(
        //     builder: (context, state) {
        //       if (state is ListFetchingSuccessfullState) {
        //         return Center(
        //           child: Text(""
        //               // "Total: ${(state as CartFetchingSucessState).totalvalue.toStringAsFixed(2)}",
        //               ),
        //         );
        //       } else {
        //         return const Text(StringConstants.zero);
        //       }
        //     },
        //   ),
        // ),
        SizedBox(
          width: double.maxFinite,
          child: ElevatedButton(
            onPressed: () {
              BlocProvider.of<CartBloc>(context).add(
                const PlaceOrderEvent(orderList: []),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10), // Adjust padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Adjust border radius
              ),
            ),
            child: const Text(
              StringConstants.placeOrderText,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
