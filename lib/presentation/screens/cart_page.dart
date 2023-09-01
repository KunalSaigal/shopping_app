import 'package:flutter/material.dart';
import 'package:practice_shopping_app/data/item_lists.dart';
import 'package:practice_shopping_app/presentation/widgets/cart_tile.dart';

import '../../data/data_model/data_model.dart';

class CartPage extends StatelessWidget {
  final List<ShoppingListModel> cartItemInstance;
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
      )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: ListView.builder(
            itemCount: cartItemInstance.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: CartTile(cartitem: cartItemInstance[index]),
              );
            },
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(15),
        width: 400,
        child: ElevatedButton(
          onPressed: () {
            previous_orders.add(cartItems);
            cartItems.clear();
            print(previous_orders[0].toString());
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
