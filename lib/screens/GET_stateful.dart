// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace, unnecessary_null_comparison, prefer_if_null_operators, prefer_interpolation_to_compose_strings

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http_method/models/GET/http_GET_stateful.dart';

class MygetStateful extends StatefulWidget {
  MygetStateful({Key? key}) : super(key: key);

  @override
  State<MygetStateful> createState() => _MygetStatefulState();
}

class _MygetStatefulState extends State<MygetStateful> {
  HttpGetStateful dataResponse =
      HttpGetStateful(id: '', fullname: '', email: '', avatar: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 100,
                height: 100,
                child: Image.network(
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Text(
                      'Please Press Button Before',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    );
                  },
                  dataResponse.avatar == null
                      ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'
                      : dataResponse.avatar,
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    dataResponse.id == null ? "ID: " : "ID: ${dataResponse.id}",
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
                    dataResponse.fullname == null
                        ? "Fullname : "
                        : "Fullname : ${dataResponse.fullname}",
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
                    dataResponse.email == null
                        ? "EMAIL: "
                        : "EMAIL: ${dataResponse.email}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                HttpGetStateful.connectAPI(
                        (1 + Random().nextInt(10)).toString())
                    .then((value) {
                  setState(() {
                    dataResponse = value;
                  });
                });
              },
              child: Text(
                'GET DATA',
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
