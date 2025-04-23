import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:chat_2025/core/model/chat_user.dart';
import 'package:chat_2025/core/service/auth/auth_service.dart';

class AuthMocksService implements AuthService {
  static Map<String, ChatUser> _users = {};
  static ChatUser? _currentUser;

  static MultiStreamController<ChatUser?>? _controller;
  static final _userStream = Stream<ChatUser?>.multi((controller) {
    _controller = controller;
    _currentUser = null;
    _updateUser(null);
  });

  @override
  ChatUser? get currentUser {
    return _currentUser;
  }

  @override
  Future<void> login(String email, String password) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  @override
  Future<void> singnup(
    String name,
    String email,
    String password,
    File image,
  ) async {
    final newUser = new ChatUser(
      id: Random().nextDouble().toString(),
      name: name,
      email: email,
      imageURL: image.path,
    );

    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  @override
  Stream<ChatUser?> get userChanges {
    return _userStream;
  }

  static void _updateUser(ChatUser? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
