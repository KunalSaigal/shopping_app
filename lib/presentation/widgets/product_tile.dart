import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_shopping_app/core/constants/color_contants.dart';
import 'package:practice_shopping_app/core/constants/string_constants.dart';
import 'package:practice_shopping_app/domain/entities/shopping_item.dart';

import '../state_management/bloc/shopping_bloc.dart';

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
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).orientation == Orientation.landscape
          ? MediaQuery.of(context).size.height / 2
          : MediaQuery.of(context).size.height / 4,
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
              padding: const EdgeInsets.only(right: 5, left: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(
                          shoppingListModel.title,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).devicePixelRatio * 10,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.primaryColor),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border_outlined),
                        color: ColorConstants.primaryColor,
                        iconSize: MediaQuery.of(context).devicePixelRatio * 10,
                      )
                    ],
                  ),
                  Text(
                    shoppingListModel.description,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).devicePixelRatio * 7,
                    ),
                  ),
                  Text(
                    '\$${shoppingListModel.price.toString()}',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).devicePixelRatio * 6,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                ColorConstants.primaryColor),
                          ),
                          onPressed: () {
                            BlocProvider.of<ShoppingBloc>(context).add(
                              AddtoCartEvent(
                                currentItem: shoppingListModel,
                                cartList: cartList,
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  StringConstants.itemAddedConformationText,
                                ),
                                duration: Duration(seconds: 1),
                              ),
                            );
                            // print(cartItems);a
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              textAlign: TextAlign.center,
                              StringConstants.addButtonText,
                              style: TextStyle(color: Colors.white),
                              maxLines: 1,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {
                                BlocProvider.of<ShoppingBloc>(context).add(
                                  DecreaseQuantityEvent(
                                    currentItem: shoppingListModel,
                                    shoppingList: shoppingList,
                                    cartList: cartList,
                                  ),
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
                                    shoppingList: shoppingList,
                                    cartList: cartList,
                                  ),
                                );
                              },
                              icon: const Icon(Icons.add_circle_outline),
                            ),
                          ],
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
