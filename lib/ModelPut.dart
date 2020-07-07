import 'dart:convert';

import 'package:http/http.dart' as http;

class PutResult{
  String name;
  String job;

  PutResult({
    this.name, this.job
  });
  factory PutResult.createPutResult(Map<String, dynamic> object){
    return PutResult(

        name: object['name'],
        job: object['job'],

    );
  }
  static Future<PutResult> connectToAPI(String name, String job) async{
    String apiURL = "https://reqres.in/api/users/2";
    var apiResult = await http.put(apiURL, body: {"name": name,"job": job});
    var jsonObject = json.decode(apiResult.body);
    return PutResult.createPutResult(jsonObject);
  }

}