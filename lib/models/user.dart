import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String uid;
  User({this.uid , this.name});
}

class UserData {
  final String uid;
  final String name;
  final String email;
  final String gender;
  final int year;
  final bool isThaparStudent;
  //social media links....
  UserData(
      {this.uid,
      this.name,
      this.email,
      this.gender,
      this.year,
      this.isThaparStudent});

  factory UserData.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return UserData(
      uid: doc.documentID,
      email: data['email'] ?? '',
      gender: data['gender'] ?? '',
      isThaparStudent: data['isThaparStudent'] ?? '',
      name: data['name'] ?? '',
      year: data['year'] ?? 0,
    );
  }
}
