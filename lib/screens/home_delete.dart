// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomeDelete extends StatefulWidget {
  const MyHomeDelete({Key? key}) : super(key: key);

  @override
  State<MyHomeDelete> createState() => _MyHomeDeleteState();
}

String data = "data";

class _MyHomeDeleteState extends State<MyHomeDelete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Delete'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              var myresponse = await http.get(
                Uri.parse('https://reqres.in/api/users/2'),
              );
              Map<String, dynamic> mybody = json.decode(myresponse.body);
              print(mybody);

              setState(() {
                data =
                    '${mybody['data']['first_name']} - ${mybody['data']['last_name']}';
              });
            },
            icon: Icon(Icons.get_app_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Text(
              data,
            ),
            ElevatedButton(
              onPressed: () async {
                var response = await http
                    .delete(Uri.parse('https://reqres.in/api/users/2'));

                if (response.statusCode == 204) {
                  setState(() {
                    data = "delete data";
                  });
                }
              },
              child: Text('delete data'),
            ),
          ],
        ),
      ),
    );
  }
}
