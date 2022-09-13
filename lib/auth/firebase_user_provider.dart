import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class DmlLiveFirebaseUser {
  DmlLiveFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

DmlLiveFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<DmlLiveFirebaseUser> dmlLiveFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<DmlLiveFirebaseUser>(
        (user) => currentUser = DmlLiveFirebaseUser(user));
