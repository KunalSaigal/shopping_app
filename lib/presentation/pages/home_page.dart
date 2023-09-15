import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_shopping_app/core/constants/string_constants.dart';
import 'package:practice_shopping_app/core/routes/routes.dart';
import 'package:practice_shopping_app/presentation/widgets/shopping_list.dart';
import '../bloc/shopping_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            StringConstants.homePageHeaderText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          BlocBuilder<ShoppingBloc, ShoppingState>(
            builder: (context, state) {
              return Row(
                children: [
                  (state is ListFetchingSuccessfullState)
                      ? Text("${state.cartItems.length}")
                      : const Text(StringConstants.empty),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    onPressed: () {
                      if (state is ListFetchingSuccessfullState) {
                        AutoRouter.of(context).push(
                          CartRoute(
                            cartItemList: state.cartItems,
                            currentOrderList: state.orderLists,
                          ),
                        );
                      } else {
                        AutoRouter.of(context).push(
                          CartRoute(
                            cartItemList: const [],
                            currentOrderList: const [],
                          ),
                        );
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(3),
        child: const ShoppingListItems(),
      ),
    );
  }
}
