import 'package:breview/models/reviewer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<Reviewer> getUserData(phoneNumber) async {
    return db
        .collection("users")
        .where("cellNumber", isEqualTo: phoneNumber)
        .get()
        .then((result) {
      if (result.docs.length > 0) {
        return Reviewer(
            uid: result.docs[0].id,
            username: result.docs[0].data().toString().contains('username')
                ? result.docs[0].get('username')
                : '',
            phoneNumber: result.docs[0].data().toString().contains('cellNumber')
                ? result.docs[0].get('cellNumber')
                : '');
      } else {
        return null;
      }
    });
    // return Reviewer(
    //     uid: "11111111111", username: "ssssssss", phoneNumber: "3333333333");
  }

  // create user obj based on firebase user
  Reviewer _userFromFirebaseUser(User user) async {
    // if (user == null) {
    //   return null;
    // }

    // db
    //     .collection("users")
    //     .where("cellNumber", isEqualTo: user.phoneNumber)
    //     .get()
    //     .then((result) {
    //   if (result.docs.length > 0) {
    //     return Reviewer(
    //         uid: user.uid,
    //         username: result.docs[0].data().toString().contains('username')
    //             ? result.docs[0].get('username')
    //             : '',
    //         phoneNumber:
    //             result.docs[0].data().toString().contains('phoneNumber')
    //                 ? result.docs[0].get('phoneNumber')
    //                 : '');
    //   } else {
    //     return Reviewer(uid: user.uid, username: "", phoneNumber: "");
    //   }
    // });

    print("aaaaaaaaaaaaaa");

    dynamic d = getUserData(user.phoneNumber);
    d.then((res) async {
      print(res);
    });
    print(d);
    // getUserData(user.phoneNumber).then((reviewer) {
    //   print(reviewer.uid);
    //   print(reviewer.username);
    //   print(reviewer.phoneNumber);
    // });

    // Reviewer r = getUserData(user.phoneNumber);
    print("bbbbbbbbbbb");

    // print(d);
    return user != null ? Reviewer(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<Reviewer> get user {
    return _auth.authStateChanges().map((User user) {
      return _userFromFirebaseUser(user);
    });
    // .map(_userFromFirebaseUser);
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
