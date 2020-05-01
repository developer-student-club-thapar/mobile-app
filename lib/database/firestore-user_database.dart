import 'package:dsc_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
//collection refernce
  final CollectionReference userCollection =
      Firestore.instance.collection('Users');

//update Database
  Future updateUserData(String name, String email, String gender, int year,
      bool isThaparStudent) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'email': email,
      'gender': gender,
      'year': year,
      'isThaparStudent': isThaparStudent,
      'uid': uid,
      'eventsAttended': [],
      'image': ''
    });
  }

//get userData stream
  Stream<UserData> get userDataStream {
    return userCollection
        .document(uid)
        .snapshots()
        .map((snap) => UserData.fromFirestore(snap));
  }
}
