// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http_method/homepage.dart';
import 'package:http_method/models/POST/http_POST_provider.dart';
import 'package:http_method/screens/POST_provider.dart';
import 'package:http_method/screens/POST_stateful.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HttpProvider>(
          create: (_) => HttpProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        routes: {
          '/homepage': (context) => MyHomePage(title: ''),
          '/home_stateful': (context) => MyhomeStateful(),
          '/home_provider': (context) => MyhomeProvider(),
        },
      ),
    );
  }
}
