import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_list/screens/auth_screen.dart';
import 'package:lazy_list/provider/repo_provider.dart';
import 'package:lazy_list/screens/my_home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RepoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          appBarTheme: AppBarTheme(
            color: Colors.blueGrey,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          cupertinoOverrideTheme: CupertinoThemeData(
            barBackgroundColor: Colors.blueGrey,
            primaryColor: Colors.blueGrey,
            textTheme: CupertinoTextThemeData(
              navTitleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              navLargeTitleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              // textStyle: TextStyle(
              //   color: Colors.white,
              //   fontWeight: FontWeight.bold,
              // ),
            ),
          ),
        ),
        home: MyHome(),
      ),
    );
  }
}
