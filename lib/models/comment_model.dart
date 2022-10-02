//@dart=2.9

import 'package:dggcourses/models/reply_model.dart';
import 'package:dggcourses/models/user_model.dart';

class CommentModel {
  String id;
  String article_id;
  String text;
  int total_likes;
  String user_id;
  UserModel user;
  List<ReplyModel> replies;

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    article_id = json['article_id'];
    text = json['text'];
    total_likes = json['total_likes'];
    user_id = json['user_id'];
    user = UserModel.fromJson(json['user']);
    replies = json['replies'].map<ReplyModel>((reply) => ReplyModel.fromJson(reply)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "id" : id,
      "article_id" : article_id,
      "text" : text,
      "total_likes" : total_likes,
      "user_id" : user_id,
      "user" : user.toJson(),
      "replies": replies.map((reply) => reply.toJson()).toList(),
    };
  }
}