import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar_text.dart';

import '../apis/local_auth_api.dart';

import './my_home.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: AppBarText(
            title: 'Authenticate',
          ),
        ),
        body: AuthBody(),
      );
    } else if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.blueGrey,
          leading: AppBarText(
            title: 'Authenticate',
          ),
        ),
        child: AuthBody(),
      );
    } else
      return Scaffold(
        body: Center(
          child: Text('Currently not supported'),
        ),
      );
  }
}

class AuthBody extends StatelessWidget {
  const AuthBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () async {
            final isAuthenticated = await LocalAuth.authenticate();
            print(isAuthenticated);
            if (isAuthenticated) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MyHome()));
            } else {
              print('not auth');
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Authentication failed'),
              ));
            }
          },
          child: Text('Authenticate'),
        ),
      ),
    );
  }
}
