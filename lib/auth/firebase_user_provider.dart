import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class HvARTHarDuSettFirebaseUser {
  HvARTHarDuSettFirebaseUser(this.user);

  User? user;

  bool get loggedIn => user != null;
}

HvARTHarDuSettFirebaseUser? currentUser;

bool get loggedIn => currentUser?.loggedIn ?? false;

Stream<HvARTHarDuSettFirebaseUser> hvARTHarDuSettFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<HvARTHarDuSettFirebaseUser>(
      (user) {
        currentUser = HvARTHarDuSettFirebaseUser(user);
        return currentUser!;
      },
    );
