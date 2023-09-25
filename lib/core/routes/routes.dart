import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice_shopping_app/presentation/pages/bottom_navigation.dart';
import '../../domain/entities/shopping_item.dart';
import '../../presentation/pages/auth_page.dart';
import '../../presentation/pages/cart_page.dart';
import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/order_page.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: AuthRoute.page, initial: true),
        AutoRoute(
          page: BottomNavRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page, initial: true),
            AutoRoute(page: CartRoute.page),
            AutoRoute(page: OrderRoute.page),
          ],
        ),
      ];
}
