import 'dart:io';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_list/screens/my_home.dart';
import 'package:lazy_list/widgets/appbar_text.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarText(title: 'Jake\'s Git'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => MyHome(),
            ),
          ),
          child: Text('Click to load Jake\'s Git Repositories'),
        ),
      ),
    );
  }
}
