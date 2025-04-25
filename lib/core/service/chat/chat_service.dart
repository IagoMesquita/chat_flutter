import 'package:chat_2025/core/model/chat_message.dart';
import 'package:chat_2025/core/model/chat_user.dart';
import 'package:chat_2025/core/service/chat/chat_mock_service.dart';

abstract class ChatService {
  Stream<List<ChatMessage>> messagesStream();
  Future<ChatMessage> save(String text, ChatUser user);

  factory ChatService() {
    return ChatMockService();
  }
}