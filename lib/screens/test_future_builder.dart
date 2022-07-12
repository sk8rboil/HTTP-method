// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyFutureBuilder extends StatelessWidget {
  const MyFutureBuilder({Key? key}) : super(key: key);

  Future getallUser() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getallUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(),
                title: Text('name'),
                subtitle: Text('email'),
              );
            },
            itemCount: 5,
          );
        },
      ),
    );
  }
}
