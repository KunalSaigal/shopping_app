import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_shopping_app/core/routes/routes.dart';
import 'package:auto_route/auto_route.dart';
import '../cubit/auth_cubit.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthCompletionState) {
              AutoRouter.of(context).pushAndPopUntil(
                const BottomNavRoute(),
                predicate: (route) {
                  if (route is BottomNavRoute) {
                    return true;
                  } else {
                    return false;
                  }
                },
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Image.asset(
                        "/Users/coditas/Desktop/practice_shopping_app/assets/images/logo.png"),
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Ex.- abc@gmail.com",
                      labelText: "Enter Your Email",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email Cannot be Empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return "Please Enter Your Password Correctly";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter Your Password",
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ), // Adjust padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Adjust border radius
                      ),
                    ),
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context)
                          .signInWithEmailAndPassword(
                        _emailController.text,
                        _passwordController.text,
                      );
                    },
                    child: const Text("Sign In"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("If You Are a new user then click :"),
                      TextButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ), // Adjust padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Adjust border radius
                          ),
                        ),
                        onPressed: () {
                          BlocProvider.of<AuthCubit>(context)
                              .registerWithEmailAndPassword(
                            _emailController.text,
                            _passwordController.text,
                          );
                        },
                        child: const Text("Register"),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
