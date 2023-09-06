import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_shopping_app/domain/entities/shopping_item.dart';
import 'package:practice_shopping_app/presentation/bloc/shopping_bloc.dart';

class ProductTile extends StatelessWidget {
  final List<ShoppingItemEntity> shoppingList;
  final ShoppingItemEntity shoppingListModel;
  final List<ShoppingItemEntity> cartList;
  const ProductTile(
      {super.key,
      required this.shoppingListModel,
      required this.cartList,
      required this.shoppingList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.blue,
        //     spreadRadius: 2,
        //     blurRadius: 2,
        //     offset: Offset(1, 2),
        //   ),
        //   BoxShadow(
        //     color: Colors.black,
        //     spreadRadius: 2,
        //     blurRadius: 2,
        //     offset: Offset(1, 2),
        //   ),
        // ],
      ),
      height: MediaQuery.of(context).size.height / 4,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 3.5,
            padding: const EdgeInsets.all(3),
            child: Image.network(
              shoppingListModel.image,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 7, left: 5),
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
                        icon: const Icon(Icons.favorite_border_outlined),
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
                  Text(
                    '\$${shoppingListModel.price.toString()}',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Theme.of(context).primaryColor)),
                            onPressed: () {
                              BlocProvider.of<ShoppingBloc>(context).add(
                                AddtoCartEvent(
                                    currentItem: shoppingListModel,
                                    cartList: cartList),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Item Added!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              // print(cartItems);
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
                          onPressed: () {
                            BlocProvider.of<ShoppingBloc>(context).add(
                              DecreaseQuantityEvent(
                                  currentItem: shoppingListModel,
                                  shoppingList: shoppingList),
                            );
                          },
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        Text(
                          shoppingListModel.itemQuantity.toString(),
                        ),
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<ShoppingBloc>(context).add(
                              IncreaseQuantityEvent(
                                  currentItem: shoppingListModel,
                                  shoppingList: shoppingList),
                            );
                          },
                          icon: const Icon(Icons.add_circle_outline),
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
    );
  }
}
