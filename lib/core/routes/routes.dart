import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice_shopping_app/features/bottom_nav/presentation/pages/bottom_navigation_page.dart';
import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/fetch_shopping_list/presentation/pages/home_page.dart';
import '../../features/fetch_order/presentation/page/order_page.dart';
import '../../features/show_cart/presentaion/pages/cart_page.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: AuthRoute.page),
        AutoRoute(
          page: BottomNavRoute.page,
          initial: true,
          children: [
            AutoRoute(page: HomeRoute.page, initial: true),
            AutoRoute(page: CartRoute.page),
            AutoRoute(page: OrderRoute.page),
          ],
        ),
      ];
}
