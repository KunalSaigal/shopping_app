import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_shopping_app/domain/entities/shopping_item.dart';
import 'package:practice_shopping_app/presentation/bloc/shopping_bloc.dart';
import 'package:practice_shopping_app/presentation/widgets/cart_tile.dart';

class CartPage extends StatelessWidget {
  final List<ShoppingItemEntity> cartItemList;
  final List<List<ShoppingItemEntity>> currentOrderList;
  const CartPage(
      {super.key, required this.cartItemList, required this.currentOrderList});

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
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: BlocBuilder<ShoppingBloc, ShoppingState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: cartItemList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CartTile(cartitem: cartItemList[index]),
                  );
                },
              );
            },
          ),
        ),
      ),
      persistentFooterButtons: [
        SizedBox(
          width: double.maxFinite,
          child: ElevatedButton(
            onPressed: () {
              BlocProvider.of<ShoppingBloc>(context).add(
                PlaceOrderEvent(
                    currentCart: cartItemList, orderList: currentOrderList),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10), // Adjust padding
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
      ],
    );
  }
}
