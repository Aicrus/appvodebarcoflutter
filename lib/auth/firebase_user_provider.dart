import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class VoDeBarcoFirebaseUser {
  VoDeBarcoFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

VoDeBarcoFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<VoDeBarcoFirebaseUser> voDeBarcoFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<VoDeBarcoFirebaseUser>(
        (user) => currentUser = VoDeBarcoFirebaseUser(user));
