import 'dart:math';

import 'package:chat_2025/core/model/chat_notification.dart';
import 'package:chat_2025/core/service/auth/auth_service.dart';
import 'package:chat_2025/core/service/notification/chat_notification_service.dart';
import 'package:chat_2025/pages/notification_page.dart';
import 'package:chat_2025/widgets/messages.dart';
import 'package:chat_2025/widgets/new_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Cod3r Chat',
        )),
        backgroundColor: Theme.of(context).colorScheme.primary,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              items: const [
                DropdownMenuItem(
                    value: 'logout',
                    child: Row(
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.black87,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Sair')
                      ],
                    ))
              ],
              onChanged: (value) {
                if (value == 'logout') {
                  AuthService().logout();
                }
              },
            ),
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return const NotificationPage();
                  }));
                },
              ),
              Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  maxRadius: 10,
                  backgroundColor: Colors.red.shade800,
                  child: Text(
                    '${Provider.of<ChatNotificationService>(context).itemsCount}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Messages()),
            NewMessage(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () {
      //     Provider.of<ChatNotificationService>(context, listen: false)
      //         .add(ChatNotification(
      //       title: 'Mais uma notificacao',
      //       body: Random().nextDouble().toString(),
      //     ));
      //   },
      // ),
    );
  }
}
