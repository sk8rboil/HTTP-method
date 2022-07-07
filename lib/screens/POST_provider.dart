// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http_method/models/POST/http_POST_provider.dart';

import 'package:provider/provider.dart';

class MyhomeProvider extends StatelessWidget {
  const MyhomeProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final datapProvider = Provider.of<HttpProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<HttpProvider>(
        builder: (BuildContext context, providervalue, Widget? child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      providervalue.data["id"] == null
                          ? "ID : 'DATA TEST ID' "
                          : "ID : ${providervalue.data["id"]}",
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
                      providervalue.data["name"] == null
                          ? "NAME : 'DATA TEST NAME' "
                          : "NAME : ${providervalue.data["name"]}",
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
                      providervalue.data["job"] == null
                          ? "JOB : 'DATA TEST JOB' "
                          : "JOB : ${providervalue.data["job"]}",
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
                      providervalue.data["createdAt"] == null
                          ? "CREATED AT : 'DATA TEST CREATED AT' "
                          : "CREAED AT : ${providervalue.data["createdAt"]}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  datapProvider.connectAPI(
                      'Atcha Provider', 'Flutter Provider');
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
      ),
    );
  }
}
