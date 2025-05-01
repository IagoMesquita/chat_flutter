import 'package:chat_2025/core/service/notification/chat_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final serviceNotification = Provider.of<ChatNotificationService>(context);
    final notificationsItems = serviceNotification.items;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Minhas notificacoes'),
          backgroundColor: Theme.of(context).colorScheme.primary,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: notificationsItems.isEmpty
            ? const Center(
                child: Text('Sem notificacoes'),
              )
            : ListView.builder(
                itemCount: notificationsItems.length,
                itemBuilder: (ctx, i) => ListTile(
                  title: Text(notificationsItems[i].title),
                  subtitle: Text(notificationsItems[i].body),
                  onTap: () => serviceNotification.remove(i),
                ),
              ));
  }
}
