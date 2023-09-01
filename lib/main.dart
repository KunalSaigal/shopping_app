import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_shopping_app/data/item_lists.dart';
import 'package:practice_shopping_app/domain/bloc/shopping_bloc.dart';
import 'package:practice_shopping_app/presentation/screens/cart_page.dart';
import 'package:practice_shopping_app/presentation/screens/home_page.dart';
import 'package:practice_shopping_app/presentation/screens/order_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShoppingBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 35, 235, 145),
          useMaterial3: true,
          iconButtonTheme: const IconButtonThemeData(
            style: ButtonStyle(
                iconColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 35, 235, 145))),
          ),
        ),
        routes: {
          '/': (context) => HomePage(),
          '/cart': (context) => CartPage(cartItemInstance: cartItems),
          '/orders': (context) => OrderPage(order_list: previous_orders),
        },
        initialRoute: "/",
      ),
    );
  }
}
