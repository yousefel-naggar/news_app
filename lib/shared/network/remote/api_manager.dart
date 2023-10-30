import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:news/models/SourcesResponse.dart';

class ApiManager {
  static Future<SourcesResponse> getSources(String category) async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources", {
      "apiKey": "960da459c4094e769c415ec6d9f7b166",
      "category": category,
    });
    Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    SourcesResponse data = SourcesResponse.fromJson(jsonData);
    return data;
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/everything?apiKey=960da459c4094e769c415ec6d9f7b166&sources=$sourceId");

    http.Response response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    return NewsResponse.fromJson(jsonData);
  }
}
