import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/repo_provider.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
    required this.controller,
    required this.icon,
  }) : super(key: key);

  final ScrollController controller;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Scrollbar(
            child: bodyData(),
            // );
            //   },
          )
        : CupertinoScrollbar(child: bodyData());
  }

  Consumer<RepoProvider> bodyData() {
    return Consumer<RepoProvider>(
      builder: (context, repo, child) => ListView.builder(
        // itemExtent: 120,
        padding: const EdgeInsets.symmetric(vertical: 10),
        controller: controller,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == repo.items.length - 1) {
            if (Platform.isIOS) {
              return Center(child: CupertinoActivityIndicator());
            } else
              return Center(child: CircularProgressIndicator());
          } else
            return Column(
              children: [
                SizedBox(
                  height: 100,
                  child: ListTile(
                    leading: child,
                    title: Text(
                      repo.items[index]['name'] ?? '',
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          repo.items[index]['description'] ?? '',
                          textAlign: TextAlign.justify,
                          maxLines: 3,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.code),
                            Text(
                              repo.items[index]['language'] ?? '',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
        },
        itemCount: repo.items.length,
      ),
      child: Icon(
        icon,
        size: 80,
        color: Colors.blueGrey,
      ),
    );
  }
}
