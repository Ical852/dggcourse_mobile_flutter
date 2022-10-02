//@dart=2.9

import 'package:dggcourses/models/course_model.dart';
import 'package:dggcourses/models/user_model.dart';

class UserCourseModel {
  String id;
  String course_id;
  String user_id;
  UserModel user;
  CourseModel course;

  UserCourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    course_id = json['course_id'];
    user_id = json['user_id'];
    user = UserModel.fromJson(json['user']);
    course = CourseModel.fromJson(json['courses']);
  }

  Map<String, dynamic> toJson() {
    return  {
      "id":id,
      "course_id":course_id,
      "user_id":user_id,
      "user":user.toJson(),
      "course": course.toJson(),
    };
  }
}