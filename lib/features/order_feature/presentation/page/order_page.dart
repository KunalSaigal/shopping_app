import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_shopping_app/features/common/entities/shopping_item.dart';

import '../../../../core/constants/string_constants.dart';
import '../bloc/order_bloc.dart';
import '../widgets/order_tile_widget.dart';

@RoutePage()
class OrderPage extends StatelessWidget {
  const OrderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            StringConstants.orderpageHeader,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrderFetchingState) {
            BlocProvider.of<OrderBloc>(context).add(
              FetchOrderListEvent(),
            );
            return const Center(child: CircularProgressIndicator());
          }
          if (state is OrderFetchingSuccessState) {
            return ListView.builder(
              itemCount: state.orderLists.length,
              itemBuilder: (context, index) {
                // Access the inner list
                List<ShoppingItemEntity> innerList = state.orderLists[index];

                if (innerList.isNotEmpty) {
                  return Column(
                    children: [
                      OrderTileWidget(
                        cartInstance: innerList,
                        upperIndex: index,
                      ),
                    ],
                  );
                } else {
                  return const Text(StringConstants.emptyOrderText);
                }
              },
            );
          } else {
            return const Text(StringConstants.emptyOrderText);
          }
        },
      ),
    );
  }
}
