import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_shopping_app/core/constants/color_contants.dart';
import 'package:practice_shopping_app/core/constants/string_constants.dart';
import 'package:practice_shopping_app/core/di/injector.dart';
import 'package:practice_shopping_app/core/routes/routes.dart';
import 'presentation/state_management/bloc/shopping_bloc.dart';
import 'presentation/state_management/cubit/auth_cubit.dart';

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
