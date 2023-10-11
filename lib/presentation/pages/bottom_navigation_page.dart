import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_shopping_app/core/routes/routes.dart';
import '../state_management/bloc/shopping_bloc.dart';

@RoutePage()
class BottomNavPage extends StatelessWidget {
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingBloc, ShoppingState>(
      builder: (context, state) {
        return AutoTabsScaffold(
          transitionBuilder: (context, child, animation) => FadeTransition(
            opacity: animation,
            // the passed child is technically our animated selected-tab page
            child: child,
          ),
          routes: [
            const OrderRoute(),
            const HomeRoute(),
            (state is ListFetchingSuccessfullState)
                ? CartRoute(
                    cartItemList: state.cartItems,
                    currentOrderList: state.orderLists)
                : CartRoute(
                    cartItemList: const [],
                    currentOrderList: const [],
                  )
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            return BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: const [
                BottomNavigationBarItem(
                  label: 'Orders',
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    Icons.home,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Cart',
                  icon: Icon(
                    Icons.shopping_cart_checkout,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
