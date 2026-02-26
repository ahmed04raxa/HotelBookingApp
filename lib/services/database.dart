import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {
  Stream<QuerySnapshot> getAllHotels() {
    return FirebaseFirestore.instance.collection('hotel').snapshots();
  }
}
