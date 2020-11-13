import 'package:dsc_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
//collection refernce
  final CollectionReference userCollection =
      Firestore.instance.collection('Users');

//update Database
  Future updateUserData(String name, String email, String gender, String year,
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

  Stream<UserData> get userDataStream {
    return userCollection.document(uid).snapshots().map((snap) {
      return UserData.fromFirestore(snap);
    });
  }

  Future<UserData> userData() async {
    DocumentSnapshot doc = await userCollection.document(uid).get();
    return UserData.fromFirestore(doc);
  }
}
