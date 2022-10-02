//@dart=2.9

import 'dart:convert';

import 'package:dggcourses/shared/theme.dart';
import 'package:http/http.dart' as http;

class ReplyService {
  Future<bool> reply({
    String comment_id,
    String text,
    int total_likes,
    String user_id
  }) async {
    var url = "$baseUrl/replies";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = jsonEncode({
      "comment_id": comment_id,
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

  Future<bool> deleteReplies({
    String reply_id,
  }) async {
    var url = "$baseUrl/replies/$reply_id";
    var headers = {
      "Content-Type" : "application/json"
    };
    var response = await http.delete(
      url,
      headers: headers,
    );

    return true;
  }

  Future<bool> likeReplies({
    String reply_id,
  }) async {
    var url = "$baseUrl/replies/$reply_id";
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