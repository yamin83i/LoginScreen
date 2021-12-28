import 'package:http/http.dart' as http;
import 'dart:convert';

class PostResult {
  String token;

  PostResult({this.token});

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(token: object['token'].toString());
  }

  static Future<PostResult> connectToAPI(String email, String password) async {
    String apiURL = "https://reqres.in//api/login";

    var apipost =
        await http.post(apiURL, body: {"email": email, "password": password});
    var jsonObject = json.decode(apipost.body.toString());

    return PostResult.createPostResult(jsonObject);
  }
}
