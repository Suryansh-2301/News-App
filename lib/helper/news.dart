import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];
  
  Future<void> getNews() async {
    String url = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ece29005ac1946cbb1e994afc28f779d";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element['description'] != null){
          ArticleModel articleModel = new ArticleModel(
            title: element['title'],
            author: element["author"],
          );
        }
      });
    }
  }
}