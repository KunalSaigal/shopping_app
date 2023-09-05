import 'package:flutter/material.dart';
import 'package:practice_shopping_app/data/item_lists.dart';
import 'package:practice_shopping_app/domain/entities/shopping_item.dart';
import '../widgets/cart_tile.dart';

class OrderPage extends StatelessWidget {
  final List<List<ShoppingItemEntity>> order_list;
  const OrderPage({super.key, required this.order_list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Your Orders",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: ListView.builder(
            itemCount: order_list.length,
            itemBuilder: (context, outerIndex) {
              return Column(children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: previous_orders[outerIndex].length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CartTile(cartitem: order_list[outerIndex][index]),
                    );
                  },
                ),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
