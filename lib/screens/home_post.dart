// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_new

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String dataResponse = 'Data response';

class MyHomePost extends StatefulWidget {
  const MyHomePost({Key? key}) : super(key: key);

  @override
  State<MyHomePost> createState() => _MyHomePostState();
}

class _MyHomePostState extends State<MyHomePost> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameC = TextEditingController();
    TextEditingController jobC = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP'),
        centerTitle: true,
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: nameC,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: jobC,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Job',
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              //post
              /* var myresponse = await http.post(
                Uri.parse("https://reqres.in/api/users"),
                body: {
                  "name": nameC.text,
                  "job": jobC.text,
                },
              );
              Map<String, dynamic> data =
                  json.decode(myresponse.body) as Map<String, dynamic>;
              setState(() {
                dataResponse = "${data['name']} - ${data['job']}";
              }); */

              //put
              var myresponse = await http.patch(
                Uri.parse("https://reqres.in/api/users/3"),
                body: {
                  "name": nameC.text,
                  "job": jobC.text,
                },
              );
              Map<String, dynamic> data =
                  json.decode(myresponse.body) as Map<String, dynamic>;
              setState(() {
                dataResponse = "${data['name']} - ${data['job']}";
              });
            },
            child: Text('POST'),
          ),
          Divider(),
          Text(dataResponse),
        ],
      ),
    );
  }
}
