import 'dart:async';
import 'dart:math';

import 'package:chat_2025/core/model/chat_message.dart';
import 'package:chat_2025/core/model/chat_user.dart';
import 'package:chat_2025/core/service/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
      id: '1',
      text: 'Bom dia, familia!',
      createdAt: DateTime.now(),
      userId: '123',
      userName: 'Helena',
      userImageURL: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '2',
      text: 'Bom dia! Tudo bem? ',
      createdAt: DateTime.now(),
      userId: '456',
      userName: 'Iago',
      userImageURL: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '1',
      text: 'Tudo bem por aqui.',
      createdAt: DateTime.now(),
      userId: '123',
      userName: 'Helena',
      userImageURL: 'assets/images/avatar.png',
    )
  ];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStrem = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  @override
  Stream<List<ChatMessage>> messagesStream() {
    return _msgsStrem;
  }

  @override
  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageURL: user.imageURL,
    );

    _msgs.add(newMessage);
    _controller?.add(_msgs.reversed.toList());

    return newMessage;
  }
}
