// ignore_for_file: file_names, avoid_print, prefer_interpolation_to_compose_strings, prefer_const_constructors, unnecessary_import, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpDeleteProvider extends ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  int get getData => _data.length;

  Uri? url;

  void connectAPI(String id, BuildContext context) async {
    url = Uri.parse("https://reqres.in/api/users/" + id);

    var testResponse = await http.get(url!);

    if (testResponse.statusCode == 200) {
      _data = (json.decode(testResponse.body))["data"];
      notifyListeners();
      showStatusCode(context, 'Show Get Data');
    } else {
      showStatusCode(context, 'ERROR ${testResponse.statusCode}');
    }
  }

  void deleteData(BuildContext context) async {
    var testResponse = await http.delete(url!);
    print(testResponse.statusCode);

    if (testResponse.statusCode == 204) {
      _data = {};
      notifyListeners();
      showStatusCode(context, "No Content!");
    }
  }

  showStatusCode(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(milliseconds: 700),
      ),
    );
  }
}
