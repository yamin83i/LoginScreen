import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  String token;

  PostResult({this.token});

  static Future<PostResult> connectToAPI(String email, String password) async {
    Uri url = Uri.parse("https://reqres.in/api/login");

    var hasilResponse = await http.post(
      url,
      body: {
        "email": email,
        "password": password,
      },
    );

    var data = json.decode(hasilResponse.body);

    return PostResult(
      token: data["token"],
    );
  }
}
