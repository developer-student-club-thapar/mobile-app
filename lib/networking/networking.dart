import 'package:http/http.dart' as http;
import 'dart:convert';

Future fetchData(String url) async {
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var decodedJson = jsonDecode(response.body);
    decodedJson = decodedJson[0];
   return decodedJson;
  }
}
