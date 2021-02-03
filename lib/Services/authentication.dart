import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduatio_project103/Services/database.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  AuthenticationService(this._firebaseAuth);

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String password, String role}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      Database(_firebaseAuth.currentUser.uid).addUser(email, role);
    } on FirebaseException catch (er) {
      return er.message;
    }
  }
}
