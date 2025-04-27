import 'dart:math';

import 'package:chat_2025/core/model/chat_message.dart';
import 'package:chat_2025/core/service/auth/auth_service.dart';
import 'package:chat_2025/core/service/chat/chat_service.dart';
import 'package:chat_2025/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().currentUser;

    return StreamBuilder<List<ChatMessage>>(
      stream: ChatService().messagesStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('Sem menssagens! Vamos conversar?'),
          );
        } else {
          final messages = snapshot.data!;

          return ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, i) {
              return MessageBubble(
                key: ValueKey(messages[i].id),
                message: messages[i],
                belongsToCurrentUser: currentUser?.id == messages[i].userId,
              );
            },
            // itemBuilder: messages,
          );
        }
      },
    );
  }
}
