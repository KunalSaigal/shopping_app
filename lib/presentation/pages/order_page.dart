import 'package:flutter/material.dart';
import 'package:practice_shopping_app/domain/entities/shopping_item.dart';
import 'package:practice_shopping_app/presentation/widgets/order_tile.dart';

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
      body: ListView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: order_list.length,
        itemBuilder: (context, index) {
          // Access the inner list
          List<ShoppingItemEntity> innerList = order_list[index];

          return OrderTile(
            cartInstance: innerList,
            upperIndex: index,
          );
        },
      ),
    );
  }
}
