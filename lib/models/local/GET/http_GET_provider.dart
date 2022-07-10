// ignore_for_file: file_names, avoid_print, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HttpGetProvider extends ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  int get getData => _data.length;
  void connectAPI(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/" + id);

    var testRepsonse = await http.get(url);

    _data = (json.decode(testRepsonse.body))["data"];
    print(data);

    notifyListeners();
  }
}
