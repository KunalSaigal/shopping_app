import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:practice_shopping_app/data/item_lists.dart';
import 'package:practice_shopping_app/data/data_model/data_model.dart';

class ProductTile extends StatelessWidget {
  final Bloc bloc;
  final ShoppingListModel shoppingListModel;
  const ProductTile({
    super.key,
    required this.bloc,
    required this.shoppingListModel,
  });

  @override
  Widget build(BuildContext context) {
    // MediaQueryData mediaQueryData = MediaQuery.of(context);
    return SizedBox(
        height: 170,
        child: Card(
          elevation: 2,
          color: Colors.white,
          margin: const EdgeInsets.all(2),
          child: Row(
            children: [
              Container(
                width: 140,
                padding: const EdgeInsets.all(3),
                child: Image.network(
                  shoppingListModel.image,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    shoppingListModel.title,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.favorite_border_outlined),
                                  color: Theme.of(context).primaryColor,
                                  iconSize: 25,
                                )
                              ],
                            ),
                            Flexible(
                              child: Text(
                                shoppingListModel.description,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                maxLines: 2,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                            Text('\$${shoppingListModel.price.toString()}',
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Theme.of(context)
                                                      .primaryColor)),
                                      onPressed: () {
                                        cartItems.add(shoppingListModel);
                                        itemQuantityList.putIfAbsent(
                                            shoppingListModel.id,
                                            () =>
                                                shoppingListModel.itemQuantity);
                                        if (itemQuantityList[
                                                shoppingListModel.id] !=
                                            null) {
                                          itemQuantityList[
                                                  shoppingListModel.id] =
                                              shoppingListModel.itemQuantity;
                                        }
                                        print(itemQuantityList);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text('Item Added!'),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );

                                        print(cartItems);
                                      },
                                      child: const Text(
                                        textAlign: TextAlign.center,
                                        "Add",
                                        style: TextStyle(color: Colors.white),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon:
                                        const Icon(Icons.remove_circle_outline),
                                  ),
                                  Text(shoppingListModel.itemQuantity
                                      .toString()),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_circle_outline),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
