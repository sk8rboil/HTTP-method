// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print, prefer_interpolation_to_compose_strings

// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpGetStateful {
  String id;
  String fullname;
  String email;
  String avatar;
  HttpGetStateful({
    required this.id,
    required this.fullname,
    required this.email,
    required this.avatar,
  });

  static Future<HttpGetStateful> connectAPI(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/" + id);

    var testRepsonse = await http.get(url);

    var data = (json.decode(testRepsonse.body))["data"];
    print(data);

    return HttpGetStateful(
      id: data["id"].toString(),
      fullname: data["first_name"] + " " + data["last_name"],
      avatar: data["avatar"],
      email: data["email"],
    );
  }
}
