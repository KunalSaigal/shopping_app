import 'package:flutter/material.dart';
import 'package:practice_shopping_app/domain/entities/shopping_item.dart';

class CartTile extends StatelessWidget {
  final ShoppingItemEntity cartitem;

  const CartTile({
    super.key,
    required this.cartitem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: const EdgeInsets.all(1),
      child: Padding(
        padding: const EdgeInsets.only(right: 5, top: 3, bottom: 3, left: 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 9,
              width: MediaQuery.of(context).size.width / 5,
              child: Image.network(
                cartitem.image,
                fit: BoxFit.contain,
              ),
            ),
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartitem.title,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'X ${cartitem.itemQuantity.toString()}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    (cartitem.price * cartitem.itemQuantity).toStringAsFixed(2),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
