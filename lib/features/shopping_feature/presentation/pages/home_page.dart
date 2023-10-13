import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_shopping_app/core/constants/string_constants.dart';
import 'package:practice_shopping_app/core/routes/routes.dart';

import '../../../cart_feature/presentaion/bloc/cart_bloc.dart';
import '../widgets/shopping_list_widget.dart';

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
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  (state is CartFetchingSucessState)
                      ? Text("${state.cartList.length}")
                      : const Text(StringConstants.empty),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    onPressed: () {
                      AutoRouter.of(context).push(const CartRoute());
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
