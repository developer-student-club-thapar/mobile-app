import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  final String path;
  Api({required this.path});
  final String url = "http://api.dsctiet.tech/api";

  fetchData() async {
    var response = await http.get(Uri.parse(url + path));
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      return decodedJson;
    } else
      return null;
  }
}
