import 'dart:async';
import 'dart:io';

import 'package:chat_2025/core/model/chat_user.dart';
import 'package:chat_2025/core/service/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseService implements AuthService {
  static ChatUser? _currentUser;

  static final _userStream = Stream<ChatUser?>.multi((controller) async {
    final Stream<User?> authChanges = FirebaseAuth.instance.authStateChanges();
    print({'authChanges': authChanges});

    await for (final user in authChanges) {
      _currentUser = user == null ? null : _toChatUser(user);
      controller.add(_currentUser);
      if (user != null) {
        print({'authChanges.user': user});
      }
    }
  });

  @override
  ChatUser? get currentUser {
    return _currentUser;
  }

  @override
  Future<void> singnup(
    String name,
    String email,
    String password,
    File? image,
  ) async {
    final auth = FirebaseAuth.instance;
    // Cria Usuario
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredential.user == null) return;

    // Adicionar/Atualizar nome do usuario
    userCredential.user!.updateDisplayName(name);
    // userCredential.user!.updatePhotoURL(photoURL);
  }

  @override
  Future<void> login(String email, String password) async {}

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Stream<ChatUser?> get userChanges {
    return _userStream;
  }

  static ChatUser _toChatUser(User user) {
    return ChatUser(
      id: user.uid,
      name: user.displayName ?? user.email!.split('@')[0],
      email: user.email!,
      imageURL: user.photoURL ?? 'assets/images/avatar.png',
    );
  }
}
