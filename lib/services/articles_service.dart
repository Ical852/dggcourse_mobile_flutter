//@dart=2.9

import 'dart:convert';

import 'package:dggcourses/models/article_model.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:http/http.dart' as http ;

class ArticleService {
  
  Future<List<ArticleModel>> getArticles() async {
    var url = "$baseUrl/articles";
    var heeader = {
      "Content-Type" : "application/json"
    };

    var response = await http.get(url, headers: heeader);
    List data = jsonDecode(response.body)['data'];
    List<ArticleModel> articles = [];
    for (var item in data) {
      articles.add(ArticleModel.fromJson(item));
    }

    return articles;
  }

  Future<List<ArticleModel>> getPopularArticles() async {
    var url = "$baseUrl/articles/popular";
    var heeader = {"Content-Type": "application/json"};

    var response = await http.get(url, headers: heeader);
    List data = jsonDecode(response.body)['data'];
    List<ArticleModel> articles = [];
    for (var item in data) {
      articles.add(ArticleModel.fromJson(item));
    }

    return articles;
  }
}