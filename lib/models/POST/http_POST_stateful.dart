// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateful {
  static const routeName = "/home_stateful";

  String id;
  String name;
  String job;
  String createdAt;
  HttpStateful({
    required this.id,
    required this.name,
    required this.job,
    required this.createdAt,
  });

  static Future<HttpStateful> connectAPI(String name, String job) async {
    var url = "https://reqres.in/api/users";

    var testresponse = await http.post(
      Uri.parse(url),
      body: {"name": name, "job": job},
    );

    var data = json.decode(testresponse.body);

    return HttpStateful(
      id: data["id"],
      name: data["name"],
      job: data["job"],
      createdAt: data["createdAt"],
    );
  }
}
