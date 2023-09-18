// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthPage(),
      );
    },
    CartRoute.name: (routeData) {
      final args = routeData.argsAs<CartRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CartPage(
          key: args.key,
          cartItemList: args.cartItemList,
          currentOrderList: args.currentOrderList,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    NavWidgetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NavWidget(),
      );
    },
    OrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderPage(),
      );
    },
  };
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CartPage]
class CartRoute extends PageRouteInfo<CartRouteArgs> {
  CartRoute({
    Key? key,
    required List<ShoppingItemEntity> cartItemList,
    required List<List<ShoppingItemEntity>> currentOrderList,
    List<PageRouteInfo>? children,
  }) : super(
          CartRoute.name,
          args: CartRouteArgs(
            key: key,
            cartItemList: cartItemList,
            currentOrderList: currentOrderList,
          ),
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const PageInfo<CartRouteArgs> page = PageInfo<CartRouteArgs>(name);
}

class CartRouteArgs {
  const CartRouteArgs({
    this.key,
    required this.cartItemList,
    required this.currentOrderList,
  });

  final Key? key;

  final List<ShoppingItemEntity> cartItemList;

  final List<List<ShoppingItemEntity>> currentOrderList;

  @override
  String toString() {
    return 'CartRouteArgs{key: $key, cartItemList: $cartItemList, currentOrderList: $currentOrderList}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NavWidget]
class NavWidgetRoute extends PageRouteInfo<void> {
  const NavWidgetRoute({List<PageRouteInfo>? children})
      : super(
          NavWidgetRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavWidget';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderPage]
class OrderRoute extends PageRouteInfo<void> {
  const OrderRoute({List<PageRouteInfo>? children})
      : super(
          OrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
