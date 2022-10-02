//@dart=2.9

import 'dart:convert';

import 'package:dggcourses/shared/theme.dart';
import 'package:http/http.dart' as http;

class CommentService {
  
  Future<bool> comments({
    String article_id,
    String text,
    int total_likes,
    String user_id
  }) async {
    var url = "$baseUrl/comments";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = jsonEncode({
      "article_id": article_id,
      "text": text,
      "total_likes": total_likes,
      "user_id": user_id
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body
    );

    return true;
  }

  Future<bool> deleteComments({
    String comment_id,
  }) async {
    var url = "$baseUrl/comments/$comment_id";
    var headers = {
      "Content-Type" : "application/json"
    };
    var response = await http.delete(
      url,
      headers: headers,
    );

    return true;
  }

  Future<bool> likeComments({
    String comment_id,
  }) async {
    var url = "$baseUrl/comments/$comment_id";
    var headers = {
      "Content-Type" : "application/json"
    };
    var response = await http.get(
      url,
      headers: headers,
    );

    return true;
  }
}