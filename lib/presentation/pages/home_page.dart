import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_shopping_app/presentation/pages/cart_page.dart';
import 'package:practice_shopping_app/presentation/pages/order_page.dart';
import 'package:practice_shopping_app/presentation/widgets/shopping_list.dart';

import '../bloc/shopping_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Market",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          BlocBuilder<ShoppingBloc, ShoppingState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  // Handle settings button press
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        if (state is ListFetchingSuccessfullState) {
                          return CartPage(
                            cartItemList: state.cartItems,
                            currentOrderList: state.orderLists,
                          );
                        } else {
                          return const CartPage(
                            cartItemList: [],
                            currentOrderList: [],
                          );
                        }
                      },
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      drawer: BlocBuilder<ShoppingBloc, ShoppingState>(
        builder: (context, state) {
          return Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (_) {
                          if (state is ListFetchingSuccessfullState) {
                            return OrderPage(
                              order_list: state.orderLists,
                            );
                          } else {
                            return const OrderPage(order_list: []);
                          }
                        },
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("My Orders")),
              ],
            ),
          );
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: const ShoppingListItems(),
      ),
    );
  }
}
