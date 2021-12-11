import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AccountPorvider with ChangeNotifier {
  String _id;
  String _username;
  String _profileImageURL;
  String _status;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  String get id => _id;
  String get username => _username;
  String get profileImageURL => _profileImageURL;
  String get status => _status;

  setAccount(String id) {
    //Get Data from firebase
    userCollection.doc("SdZlYdSyYQgPAbNHM8DdNWSJH5C2").get().then((value) {
      _id = value.id;
      _username = value.data()["username"];
      _status = value.data()["status"];
      _profileImageURL = value.data()["profileImageURL"];
      notifyListeners();
    });
  }
}
