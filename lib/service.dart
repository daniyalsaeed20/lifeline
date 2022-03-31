import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lifeline_system/news_model.dart';

// ignore: camel_case_types
class API_Manager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel;

    try {
      var response = await client.get(Uri.parse(
          'http://newsapi.org/v2/everything?domains=wsj.com&apiKey=944fc3e0a9fd4973ae5707135b2f383e'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}
