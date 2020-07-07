import 'dart:convert';

import 'package:http/http.dart' as http;

class PutResult{
  String id;
  String name;
  String job;
  String created;

  PutResult({
    this.id, this.name, this.job, this.created
  });
  factory PutResult.createPutResult(Map<String, dynamic> object){
    return PutResult(
        id:  object['id'],
        name: object['name'],
        job: object['job'],
        created: object['createdAt']
    );
  }
  static Future<PutResult> connectToAPI(String name, String job) async{
    String apiURL = "https://reqres.in/api/users";
    var apiResult = await http.put(apiURL, body: {"name": name,"job": job});
    var jsonObject = json.decode(apiResult.body);
    return PutResult.createPutResult(jsonObject);
  }

}