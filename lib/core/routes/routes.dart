import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/shopping_item.dart';
import '../../presentation/pages/bottom_navigation.dart';
import '../../presentation/pages/cart_page.dart';
import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/order_page.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
          page: NavBarRoute.page,
          initial: true,
          children: [
            AutoRoute(page: HomeRoute.page, initial: true),
            AutoRoute(page: CartRoute.page),
            AutoRoute(page: OrderRoute.page),
          ],
        ),
      ];
}
