import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class DailyFootballFirebaseUser {
  DailyFootballFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

DailyFootballFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<DailyFootballFirebaseUser> dailyFootballFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<DailyFootballFirebaseUser>(
            (user) => currentUser = DailyFootballFirebaseUser(user));
