//@dart=2.9

import 'package:dggcourses/models/user_model.dart';

class ReplyModel {
  String id;
  String comment_id;
  String text;
  int total_likes;
  String user_id;
  UserModel user;

  ReplyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment_id = json['comment_id'];
    text = json['text'];
    total_likes = json['total_likes'];
    user_id = json['user_id'];
    user = UserModel.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id" : id,
      "comment_id" : comment_id,
      "text" : text,
      "total_likes" : total_likes,
      "user_id" : user_id,
      "user": user.toJson(),
    };
  }
}