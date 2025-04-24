import 'package:chat_2025/core/service/auth/auth_service.dart';
import 'package:chat_2025/widgets/auth_form.dart';
import 'package:chat_2025/core/model/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;

  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      setState(() => _isLoading = true);

      if (formData.isLogin) {
        // Login
        AuthService().login(
          formData.email,
          formData.password,
        );
      } else {
        // Singnup
        AuthService().singnup(
          formData.name,
          formData.email,
          formData.password,
          formData.image,
        );
      }

      print('AuthPage....');
      print('Nome:  ${formData.name}');
      print('Email:  ${formData.email}');
      print('Senha:  ${formData.password}');
    } catch (e) {
      // Tratar erro!
    } finally {
      setState(() => _isLoading = false);
    }
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
