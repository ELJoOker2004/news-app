import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/constants.dart';
import 'package:news/model/apimodel.dart';

class ApiController {
  static Future<List<apiModel>> fetchArticles() async {
    List<apiModel> modelApi = [];
    //https://newsapi.org/v2/top-headlines?country=eg&apiKey=4bb405a4569c472cb828da07d9639f8c
    var url = Uri.parse(
        "${BaseUrl}${topHeadlines}?country=${country}&apiKey=${apiKey}");
    print(url);
    var response = await http.get(url);
    var respnoseBody = jsonDecode(response.body);
    for (var i in respnoseBody) {
      modelApi.add(apiModel(
          description: i["description"],
          name: i["source"]["name"],
          title: i["title"],
          url: i["url"],
          publishedAt: i["publishedAt"],
          urlToImage: i["urlToImage"]));
      print("$url 1");
    }
    return modelApi;
  }


  static Future<List<apiModel>> fetchCategoryArticles(String category) async {
    List<apiModel> modelApi = [];

    var url = Uri.parse(
        "${BaseUrl}top-headlines?country=$country&category=$category&apiKey=$apiKey");
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body)["articles"];
    for (var i in responsebody) {

      modelApi.add(apiModel(
          publishedAt: i["publishedAt"],
          title: i["title"],
          description: i["description"],
          url: i["url"],
          urlToImage: i["urlToImage"],
          name: i["source"]['name']));

    }
    return modelApi;
  }
}
