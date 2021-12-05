import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods{

  getData() async{
    return Firestore.instance.collection("blogs").snapshots();
  }
}