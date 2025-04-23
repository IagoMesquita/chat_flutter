import 'dart:io';

import 'package:chat_2025/core/model/chat_user.dart';

abstract class AuthService {
  ChatUser? get currentUser;

  Stream<ChatUser?> get userChanges;

  Future<void> singnup(
    String name,
    String email,
    String password,
    File image,
  );
  Future<void> login(String email, String password);
  Future<void> logout();
}
