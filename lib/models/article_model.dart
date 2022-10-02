// @dart=2.9

import 'package:dggcourses/models/article_category_model.dart';
import 'package:dggcourses/models/comment_model.dart';

class ArticleModel {
  String id;
  String author;
  String date;
  String description;
  String img;
  String title;
  ArticleCategoryModel article_category;
  List<CommentModel> comments;

  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    date = json['date'];
    description = json['description'];
    img = json['img'];
    title = json['title'];
    article_category = ArticleCategoryModel.fromJson(json['article_category']);
    comments = json['comments'].map<CommentModel>((comment) => CommentModel.fromJson(comment)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "author": author,
      "date": date,
      "description": description,
      "img": img,
      "title": title,
      "article_category": article_category.toJson(),
      "comments": comments.map((comment) => comment.toJson()).toList(),
    };
  }
}