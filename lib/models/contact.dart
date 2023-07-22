import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<ContactDetails> createContactDetails(
    String name, String email, String message) async {
  final http.Response response = await http.post(
    Uri.parse('https://dsctiet.pythonanywhere.com/api/contactus/?format=json'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'email': email,
      'message': message,
    }),
  );

  if (response.statusCode == 201) {
    return ContactDetails.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create ContactDetails.');
  }
}

class ContactDetails {
  final int id;
  final String name;
  final String email;
  final String message;

  ContactDetails(
      {required this.id,
      required this.name,
      required this.email,
      required this.message});

  factory ContactDetails.fromJson(Map<String, dynamic> json) {
    return ContactDetails(
        id: json['id'],
        name: json['title'],
        email: json['email'],
        message: json['message']);
  }
}
