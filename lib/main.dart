import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_shopping_app/presentation/pages/home_page.dart';

import 'presentation/bloc/shopping_bloc.dart';

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
          scaffoldBackgroundColor: const Color.fromARGB(255, 228, 227, 227),
          primaryColor: const Color.fromARGB(255, 35, 235, 145),
          useMaterial3: true,
          iconButtonTheme: const IconButtonThemeData(
            style: ButtonStyle(
              iconColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 35, 235, 145)),
            ),
          ),
        ),
        routes: {
          '/': (context) => HomePage(),
          // '/cart': (context) => CartPage(cartItemInstance: ),
          // '/orders': (context) => OrderPage(order_list: previous_orders),
        },
        initialRoute: "/",
      ),
    );
  }
}
