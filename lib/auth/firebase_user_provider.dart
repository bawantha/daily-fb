import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class DdofbFirebaseUser {
  DdofbFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

DdofbFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<DdofbFirebaseUser> ddofbFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<DdofbFirebaseUser>((user) => currentUser = DdofbFirebaseUser(user));
