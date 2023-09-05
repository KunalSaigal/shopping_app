import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_shopping_app/presentation/pages/cart_page.dart';
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
            onPressed: () {
              // Handle search button press
            },
          ),
          BlocBuilder<ShoppingBloc, ShoppingState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  // Handle settings button press
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) {
                      if (state is ListFetchingSuccessfullState) {
                        return CartPage(cartItemInstance: state.cartItems);
                      } else {
                        return const CartPage(cartItemInstance: []);
                      }
                    },
                  ));
                },
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/orders');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("My Orders")),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: ShoppingListItems(),
      ),
    );
  }
}
