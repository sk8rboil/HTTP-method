// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HttpProvider extends ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  int get getData => _data.length;

  void connectAPI(String name, String job) async {
    var url = "https://reqres.in/api/users";

    var testresponse = await http.post(
      Uri.parse(url),
      body: {"name": name, "job": job},
    );

    _data = json.decode(testresponse.body);
    notifyListeners();
  }
}
