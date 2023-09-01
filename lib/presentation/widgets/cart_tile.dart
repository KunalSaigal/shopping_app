import 'package:flutter/material.dart';
import 'package:practice_shopping_app/data/data_model/data_model.dart';

class CartTile extends StatelessWidget {
  final ShoppingListModel cartitem;

  const CartTile({
    super.key,
    required this.cartitem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: Card(
            elevation: 2,
            color: Colors.white,
            margin: const EdgeInsets.all(3),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 1,
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
                        Flexible(
                          child: Text(
                            cartitem.title,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
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
                      flex: 1,
                      child: Container(
                        child: Text("data"),
                      )),
                ],
              ),
            )));
  }
}
