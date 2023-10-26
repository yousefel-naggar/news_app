import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/models/SourcesResponse.dart';

class ApiManager {
  static Future<SourcesResponse> getSources() async{
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "a423944efdbe47e1aba0e510decf7c95"});
    Response response =await http.get(url);
    var jsonData = jsonDecode(response.body);
    SourcesResponse data = SourcesResponse.fromJson(jsonData);
    return data;
  }
}
