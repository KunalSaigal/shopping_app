import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_shopping_app/domain/entities/shopping_item.dart';
import 'package:practice_shopping_app/presentation/widgets/order_tile.dart';

import '../bloc/shopping_bloc.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // context.read<ShoppingBloc>().add(OrderListFetchEvent());
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
      body: BlocBuilder<ShoppingBloc, ShoppingState>(
        builder: (context, state) {
          if (state is ListFetchingSuccessfullState) {
            return ListView.builder(
              itemCount: state.orderLists.length,
              itemBuilder: (context, index) {
                // Access the inner list
                List<ShoppingItemEntity> innerList = state.orderLists[index];

                return OrderTile(
                  cartInstance: innerList,
                  upperIndex: index,
                );
              },
            );
          } else {
            return const Text("No Order");
          }
        },
      ),
    );
  }
}
