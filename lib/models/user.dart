import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String uid;
  final String image;
  User({this.uid, this.name, this.image});
}

class UserData {
  final String uid;
  final String name;
  final String email;
  final String gender;
  final int year;
  final bool isThaparStudent;
  final List eventsAttended;
  final String image;
  //social media links....
  UserData(
      {this.uid,
      this.name,
      this.email,
      this.gender,
      this.year,
      this.isThaparStudent,
      this.eventsAttended,
      this.image});

  factory UserData.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return UserData(
        uid: doc.documentID,
        email: data['email'] ?? '',
        gender: data['gender'] ?? '',
        isThaparStudent: data['isThaparStudent'] ?? '',
        name: data['name'] ?? '',
        year: data['year'] ?? 0,
        eventsAttended: data['eventsAttended'] ?? '',
        image: data['image'] ?? '');
  }
}
