import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Ex.- abc@gmail.com",
                labelText: "Enter Your Email",
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Enter Your Password",
              ),
            )
          ],
        ),
      ),
    );
  }
}
