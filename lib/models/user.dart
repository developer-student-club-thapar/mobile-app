import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String uid;
  final String image;
  User({required this.uid, required this.name, required this.image});
}

class UserData {
  final String name;
  final bool isThaparStudent;
  final String image;
  final String uid;
  final String gender;
  final int year;
  final List<String> eventsAttended;
  final String email;
  //social media links....
  UserData(
      {required this.uid,
      required this.name,
      required this.email,
      required this.gender,
      required this.year,
      required this.isThaparStudent,
      required this.eventsAttended,
      required this.image});

  factory UserData.fromFirestore(DocumentSnapshot doc) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return UserData(
        uid: doc.id,
        email: data['email'] ?? '',
        gender: data['gender'] ?? '',
        isThaparStudent: data['isThaparStudent'] ?? '',
        name: data['name'] ?? '',
        year: data['year'] ?? 0,
        eventsAttended: data['eventsAttended'].cast<String>() ?? '',
        image: data['image'] ?? '');
  }
}
