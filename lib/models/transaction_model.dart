//@dart=2.9

import 'package:dggcourses/models/course_model.dart';
import 'package:dggcourses/models/user_model.dart';

class TransactionModel {
  String id;
  String course_id;
  String order_id;
  String payment_type;
  String payment_url;
  int total;
  String user_id;
  CourseModel course;
  UserModel user;

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    course_id = json['course_id'];
    order_id = json['order_id'];
    payment_type = json['payment_type'];
    payment_url = json['payment_url'];
    total = json['total'];
    user_id = json['user_id'];
    course = CourseModel.fromJson(json['course']);
    user = UserModel.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id" : id,
      "course_id" : course_id,
      "order_id" : order_id,
      "payment_type" : payment_type,
      "payment_url" : payment_url,
      "total" : total,
      "user_id" : user_id,
      "course" : course.toJson(),
      "user": user.toJson(),
    };
  }
}