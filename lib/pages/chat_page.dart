import 'package:chat_2025/core/service/auth/auth_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Chat Page',
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextButton(
            onPressed: AuthService().logout,
            child: const Text('Deslogar'),
          )
        ],
      ),
    );
  }
}
