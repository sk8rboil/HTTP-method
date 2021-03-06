// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Local',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            http_method(context, 'POST', '/post_stateful', '/post_provider',
                'HTTP-STATEFUL', 'HTTP-PROVIDER'),
            http_method(context, 'GET', '/get_stateful', '/get_provider',
                'HTTP-STATEFUL', 'HTTP-PROVIDER'),
            http_method(context, 'DELETE', '', '/delete_provider', 'NULL',
                'HTTP-PROVIDER'),
            Divider(
              height: 10,
            ),
            http_method(context, 'HOME_POST/PUT/PATCH', '', '/home_post',
                'NULL', 'HTTP-POST'),
            http_method(context, 'HOME_DELETE', '', '/home_delete', 'NULL',
                'HTTP-Delete'),
            Divider(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/test_future');
              },
              child: Text('FutureBuilder'),
            ),
          ],
        ),
      ),

// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Column http_method(BuildContext context, String title, String route,
      String route2, String button1, String button2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, route);
              },
              child: Text(button1),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, route2);
              },
              child: Text(button2),
            ),
          ],
        ),
      ],
    );
  }
}
