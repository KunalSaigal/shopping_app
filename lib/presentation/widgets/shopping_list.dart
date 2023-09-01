import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/bloc/shopping_bloc.dart';
import 'product_tile.dart';

class ShoppingListItems extends StatelessWidget {
  const ShoppingListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = ShoppingBloc();
    bloc.add(ShoppingListFetchEvent());
    return BlocBuilder<ShoppingBloc, ShoppingState>(
        bloc: bloc,
        // buildWhen: (previous, current) => current is! ListFetchingState,
        builder: (context, state) {
          if (state is ListFetchingSuccessfullState) {
            final successState = state;
            return ListView.builder(
              itemCount: successState.shoppinglist.length,
              itemBuilder: (context, index) {
                return ProductTile(
                  bloc: bloc,
                  shoppingListModel: successState.shoppinglist[index],
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
