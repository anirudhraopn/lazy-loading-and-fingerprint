import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
    );
  }
}
