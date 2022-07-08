// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, prefer_if_null_operators, prefer_adjacent_string_concatenation

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http_method/models/DELETE/http_DELETE_provider.dart';
import 'package:provider/provider.dart';

class MydeleteProvider extends StatelessWidget {
  const MydeleteProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataProvider =
        Provider.of<HttpDeleteProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<HttpDeleteProvider>(
        builder: (BuildContext context, providervalue, Widget? child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.network(providervalue.data["avatar"] == null
                      ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'
                      : providervalue.data["avatar"]),
                ),
              ),
              SizedBox(
                height: 40,
                child: Column(
                  children: [
                    Text(
                      providervalue.data["id"] == null
                          ? 'ID :'
                          : 'ID : ${providervalue.data["id"]}'.toString(),
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
                  children: [
                    Text(
                      providervalue.data["first_name"] == null &&
                              providervalue.data["last_name"] == null
                          ? 'NAME : '
                          : 'NAME : ${providervalue.data["first_name"]}' +
                              '${providervalue.data["last_name"]}',
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
                  children: [
                    Text(
                      providervalue.data["email"] == null
                          ? 'EMAIL : '
                          : 'EMAIL :${providervalue.data["email"]}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  dataProvider.connectAPI(
                      (1 + Random().nextInt(10)).toString(), context);
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dataProvider.deleteData(context);
        },
        child: Icon(Icons.delete_forever_outlined),
      ),
    );
  }
}
