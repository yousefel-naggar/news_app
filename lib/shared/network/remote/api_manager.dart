import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:news/models/SourcesResponse.dart';

class ApiManager {
  static Future<SourcesResponse> getSources() async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "a423944efdbe47e1aba0e510decf7c95"});
    Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    SourcesResponse data = SourcesResponse.fromJson(jsonData);
    return data;
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/everything?apiKey=a423944efdbe47e1aba0e510decf7c95&sources=$sourceId");

    http.Response response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    return NewsResponse.fromJson(jsonData);
  }
}
