import 'package:chat_2025/model/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formData = AuthFormData();

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.white,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              if (_formData.isSignup)
                TextFormField(
                  key: const ValueKey('name'),
                  decoration: const InputDecoration(labelText: 'Nome'),
                  initialValue: _formData.name,
                  onChanged: (value) => _formData.name = value,
                ),
              TextFormField(
                key: const ValueKey('email'),
                decoration: const InputDecoration(labelText: 'E-mail'),
                initialValue: _formData.email,
                onChanged: (value) => _formData.email = value,
              ),
              TextFormField(
                key: const ValueKey('password'),
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),
                initialValue: _formData.password,
                onChanged: (value) => _formData.password = value,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(_formData.isLogin ? 'Entrar' : 'Cadastrar')),
              TextButton(
                child: Text(_formData.isLogin
                    ? 'Criar uma nova conta?'
                    : 'Ja tenho conta.'),
                onPressed: () {
                  setState(() {
                    _formData.toggleAuthMode();
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
