import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  String id;
  String name;
  String email;
  String avatar;

  PostResult({this.id, this.name, this.email, this.avatar});

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
        id: object['id'].toString(),
        name: object['first_name'] + " " + object['last_name'],
        email: object['email'],
        avatar: object['avatar']);
  }
  static Future<PostResult> connectToAPI(String name, String job) async {
    String apiURL = "ttps://reqres.in/api/users/";
    var apiResult = await http.post(apiURL, body: {"name": name, "job": job});
    var jsonObject = json.decode(apiResult.body);
    return PostResult.createPostResult(jsonObject);
  }
}
