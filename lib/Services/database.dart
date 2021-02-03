import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final String uid;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Database(this.uid);

  Future<void> addUser(String email, String role) {
    return users.add(
      {
        'uid': uid,
        'role': role,
        'email': email,
      },
    );
  }
}
