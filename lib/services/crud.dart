import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods{

  getData(collection) async{
    return Firestore.instance.collection(collection).snapshots();
  }
}