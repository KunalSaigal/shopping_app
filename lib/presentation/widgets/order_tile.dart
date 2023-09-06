import 'package:flutter/material.dart';
import 'package:practice_shopping_app/domain/entities/shopping_item.dart';
import 'package:practice_shopping_app/presentation/widgets/cart_tile.dart';

class OrderTile extends StatelessWidget {
  final List<ShoppingItemEntity> cartInstance;
  final int upperIndex;
  const OrderTile(
      {super.key, required this.cartInstance, required this.upperIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('List ${upperIndex + 1}'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cartInstance.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                // Access and display individual objects
                ShoppingItemEntity object = cartInstance[index];
                return CartTile(cartitem: object);
              },
            ),
          ],
        ),
      ),
    );
  }
}
