import 'dart:convert';

import 'package:http/http.dart' as http;

class DeleteSome{
  String id;
  String name;
  String job;
  String created;
  Map<String, String> headers ;

  DeleteSome({
    this.id, this.name, this.job, this.created, this.headers
  });

  factory DeleteSome.deleteSome(Map<String, dynamic> object){
    return DeleteSome(
        id:  object['id'],
        name: object['name'],
        job: object['job'],
        created: object['createdAt'],
        headers: object['header']
    );
  }
  static Future<DeleteSome> deletes(String id, Map<String, String> headers) async{
    String apiURL = "https://reqres.in/api/users/2";
    var apiResult = await http.delete(apiURL, headers: headers);
    var jsonObject = json.decode(apiResult.body);

    return DeleteSome.deleteSome(jsonObject);

  }

}