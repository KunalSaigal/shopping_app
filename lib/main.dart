import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_shopping_app/core/constants/color_contants.dart';
import 'package:practice_shopping_app/core/constants/string_constants.dart';
import 'package:practice_shopping_app/core/di/injector.dart';
import 'package:practice_shopping_app/core/routes/routes.dart';
import 'package:practice_shopping_app/features/fetch_order/presentation/bloc/order_bloc.dart';
import 'package:practice_shopping_app/features/show_cart/presentaion/bloc/cart_bloc.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/fetch_shopping_list/presentation/bloc/shopping_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  Injector.setup();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShoppingBloc>(
          create: (context) => Injector.resolve<ShoppingBloc>(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => Injector.resolve<CartBloc>(),
        ),
        BlocProvider<OrderBloc>(
          create: (context) => Injector.resolve<OrderBloc>(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        title: StringConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: ColorConstants.backgroundColor,
          appBarTheme: const AppBarTheme(color: ColorConstants.appBarColor),
          primaryColor: ColorConstants.primaryColor,
          useMaterial3: true,
          iconButtonTheme: const IconButtonThemeData(
            style: ButtonStyle(
              iconColor: MaterialStatePropertyAll(ColorConstants.primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
