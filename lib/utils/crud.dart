import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
  getBooks() async {
    return FirebaseFirestore.instance.collection('books').snapshots();
  }
}
