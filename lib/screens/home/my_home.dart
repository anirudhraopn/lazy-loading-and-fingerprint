import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_list/screens/default_screen.dart';
import 'package:provider/provider.dart';

import '../provider/repo_provider.dart';
import '../widgets/appbar_text.dart';
import '../widgets/body_widget.dart';

class MyHome extends StatefulWidget {
  MyHome();
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late ScrollController controller;
  bool isLoading = false;
  int page = 1;

  @override
  void initState() {
    super.initState();
    isLoading = true;

    Provider.of<RepoProvider>(context, listen: false).fetchData(page).then((_) {
      setState(() {
        isLoading = false;
      });
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('An Error Occurred'),
          content: Text('Something went wrong! Please try again later.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DefaultScreen(),
                  ),
                );
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    });

    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  var items;
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Scaffold(
            appBar: AppBar(
              // backgroundColor: Colors.blueGrey,
              title: AppBarText(
                title: 'Jake\'s Git',
              ),
            ),
            body: isLoading
                ? Center(child: CircularProgressIndicator())
                : BodyWidget(controller: controller, icon: Icons.book),
          )
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              backgroundColor: Colors.blueGrey,
              leading: AppBarText(
                title: 'Jake\'s Git',
              ),
            ),
            child: isLoading
                ? CupertinoActivityIndicator()
                : BodyWidget(
                    controller: controller,
                    icon: CupertinoIcons.book,
                  ),
          );
  }

  void _scrollListener() async {
    // print(controller.position.extentAfter);
    if (controller.position.pixels <=
        controller.position.maxScrollExtent * 0.95) {
      page += 1;
      print(page);
      setState(() {});
      await Provider.of<RepoProvider>(context, listen: false).fetchData(page);
    }
  }
}
