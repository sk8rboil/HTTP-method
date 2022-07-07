// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:http_method/models/POST/http_POST_stateful.dart';

class MyhomeStateful extends StatefulWidget {
  const MyhomeStateful({Key? key}) : super(key: key);

  @override
  State<MyhomeStateful> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyhomeStateful> {
  HttpStateful dataResponse =
      HttpStateful(id: '', name: '', job: '', createdAt: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    dataResponse.id == null
                        ? "ID : 'DATA TEST ID' "
                        : "ID : ${dataResponse.id}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    dataResponse.name == null
                        ? "NAME : 'DATA TEST NAME' "
                        : "NAME : ${dataResponse.name}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    dataResponse.job == null
                        ? "JOB : 'DATA TEST JOB' "
                        : "JOB : ${dataResponse.job}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    dataResponse.createdAt == null
                        ? "CREATED AT : 'DATA TEST CREATED AT' "
                        : "CREAED AT : ${dataResponse.createdAt}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                HttpStateful.connectAPI("Atcha", "Flutter Dev").then((value) {
                  print(value.name);
                  print(value.job);
                  setState(() {
                    dataResponse = value;
                  });
                });
              },
              child: Text(
                'POST DATA',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
