import 'dart:io';
import 'package:breview/models/UserDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CrudMethods{

  getData(collection) async{
    return FirebaseFirestore.instance.collection(collection).snapshots();
  }

  static void saveUserData(File file, UserDetails userDetails) async {
    Reference reference =
        FirebaseStorage.instance.ref().child("test").child("test.jpg");
    UploadTask uploadTask;
    uploadTask = FirebaseStorage.instance
        .ref()
        .child("test")
        .child("test.jpg")
        .putData(await file.readAsBytes());
    String url = await reference.getDownloadURL();
    uploadTask.whenComplete(() =>
        FirebaseFirestore.instance.collection("url test").add({"url": url}));
  }
}

