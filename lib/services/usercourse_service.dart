//@dart=2.9

import 'dart:convert';

import 'package:dggcourses/models/user_course_model.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:http/http.dart' as http;

class UserCourseService {
  
  Future<UserCourseModel> buyCourse({
    String course_id,
    String user_id
  }) async {
    var url = "$baseUrl/user-course";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = jsonEncode(
      {
        "course_id" : course_id,
        "user_id" : user_id
      }
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body
    );

    var data = jsonDecode(response.body)['data'];
    UserCourseModel userCourse = UserCourseModel.fromJson(data);

    return userCourse;
  }

  Future<List<UserCourseModel>> getAllUserCourse({
    String user_id
  }) async {
    var url = "$baseUrl/user-course/user/$user_id";
    var headers = {
      "Content-Type" : "application/json"
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    List data = jsonDecode(response.body)['data'];
    List<UserCourseModel> userCourse = [];
    for (var item in data) {
      userCourse.add(UserCourseModel.fromJson(item));
    }

    return userCourse;
  }
}