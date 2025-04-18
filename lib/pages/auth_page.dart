import 'package:chat_2025/components/auth_form.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: const Center(
          child: SingleChildScrollView(
            child: AuthForm(),
          ),
        ));
  }
}
