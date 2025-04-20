import 'package:chat_2025/components/auth_form.dart';
import 'package:chat_2025/model/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;

  void _handleSubmit(AuthFormData formData) {
    setState(() {
      _isLoading = true;
    });

    print('AuthPage....');
    print('Nome:  ${formData.name}');
    print('Email:  ${formData.email}');
    print('Senha:  ${formData.password}');

    // setState(() {
    //   _isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(children: [
          Center(
            child: SingleChildScrollView(
              child: AuthForm(onSubmit: _handleSubmit),
            ),
          ),
          if (_isLoading) ...[
            Container(
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
            ),
            const Center(
              child: CircularProgressIndicator(),
            ),
          ]
        ]));
  }
}
