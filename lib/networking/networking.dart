import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking{

  Future getData(String url ) async {
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body);
        return decodedJson;
      } else
        return 'error';
    } catch (e) {
      return e;
    }
  }
}