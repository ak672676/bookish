import 'package:breview/models/review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
  getBooks() async {
    return FirebaseFirestore.instance.collection('book').snapshots();
  }

  getReviews() async {
    return FirebaseFirestore.instance.collection('review').snapshots();
  }

  static void createReview(Review review) {
    FirebaseFirestore.instance.collection("review").add(review.toJson());
  }
}
