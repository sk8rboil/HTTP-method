// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print, use_key_in_widget_constructors, must_be_immutable, unnecessary_string_interpolations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_method/models/user.dart';

class MyFutureBuilder extends StatelessWidget {
  List<UserModel> allUser = [];

  Future getallUser() async {
    try {
      var response = await http.get(Uri.parse('https://reqres.in/api/users'));
      List data = (json.decode(response.body) as Map<String, dynamic>)["data"];

      data.forEach((element) {
        allUser.add(
          UserModel.fromJson(element),
        );
      });

      print(allUser);
    } catch (e) {
      print('catch error');
      print(e);
    }
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
          } else {
            if (allUser.length == 0) {
              return Center(
                child: Text('No data'),
              );
            }

            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      '${allUser[index].avatar}',
                    ),
                  ),
                  title: Text('${allUser[index].firstname}'),
                  subtitle: Text('${allUser[index].email}'),
                );
              },
              itemCount: allUser.length,
            );
          }
        },
      ),
    );
  }
}
