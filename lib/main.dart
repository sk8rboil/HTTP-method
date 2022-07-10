// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http_method/homepage.dart';
import 'package:http_method/models/local/DELETE/http_DELETE_provider.dart';
import 'package:http_method/models/local/GET/http_GET_provider.dart';
import 'package:http_method/models/local/POST/http_POST_provider.dart';
import 'package:http_method/screens/DELETE_provider.dart';
import 'package:http_method/screens/GET_provider.dart';
import 'package:http_method/screens/GET_stateful.dart';
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
        ChangeNotifierProvider<HttpGetProvider>(
          create: (_) => HttpGetProvider(),
        ),
        ChangeNotifierProvider<HttpDeleteProvider>(
          create: (_) => HttpDeleteProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        routes: {
          '/homepage': (context) => MyHomePage(title: ''),
          '/post_stateful': (context) => MyhomeStateful(),
          '/post_provider': (context) => MyhomeProvider(),
          '/get_stateful': (context) => MygetStateful(),
          '/get_provider': (context) => MygetProvider(),
          '/delete_provider': (context) => MydeleteProvider(),
        },
      ),
    );
  }
}
