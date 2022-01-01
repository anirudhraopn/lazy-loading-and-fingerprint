import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class RepoProvider with ChangeNotifier {
  var page = 2;
  final itemPerPage = 15;
  List<Map<String, String>> _items = [];

  List<Map<String, String>> get items {
    return [..._items];
  }

  void incrementPage() {
    page += 1;
    print(page);
    notifyListeners();
  }

  Future<void> fetchData(int page) async {
    var baseUrl = Uri.parse(
        'https://api.github.com/users/JakeWharton/repos?page=$page&per_page=$itemPerPage');

    // try {
    var response = await http.get(baseUrl);

    final extractedData = jsonDecode(response.body);
    print(extractedData);
    if (extractedData == null) {
      return;
    } else
      for (int i = 0; i < extractedData.length - 1; i++) {
        // if (extractedData[i]['name'] == null ||
        //     extractedData[i]['description'] == null ||
        //     extractedData[i]['language'] == null) {
        //   continue;
        // }
        _items.add(
          {
            'name': extractedData[i]['name'] ?? '',
            'description': extractedData[i]['description'] ?? '',
            'language': extractedData[i]['language'] ?? '',
          },
        );
      }
    // } catch (error) {
    //   throw (error);
    // }
    print('${_items.length} null/not null');
    notifyListeners();
  }
}
