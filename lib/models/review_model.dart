//@dart=2.9

import 'package:dggcourses/models/user_model.dart';

class ReviewModel {
  String id;
  String course_id;
  String user_id;
  String text;
  int rate;
  UserModel user;

  ReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    course_id = json['course_id'];
    user_id = json['user_id'];
    text = json['text'];
    rate = json['rate'];
    user = UserModel.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "course_id":course_id,
      "user_id":user_id,
      "text":text,
      "rate":rate,
      "user": user.toJson(),
    };
  }
}