//@dart=2.9

import 'dart:convert';

import 'package:dggcourses/models/course_model.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:http/http.dart' as http;

class CourseService {
  
  Future<List<CourseModel>> getAllCourses() async {
    var url = "$baseUrl/courses";
    var headers = {
      "Content-Type" : "application/json"
    };

    var response = await http.get(url, headers: headers);
    List data = jsonDecode(response.body)['data'];
    List<CourseModel> courses = [];
    for (var item in data) {
      courses.add(CourseModel.fromJson(item));
    }

    return courses;
  }

  Future<List<CourseModel>> getHomeCourses() async {
    var url = "$baseUrl/courses/home";
    var headers = {
      "Content-Type" : "application/json"
    };

    var response = await http.get(url, headers: headers);
    List data = jsonDecode(response.body)['data'];
    List<CourseModel> courses = [];
    for (var item in data) {
      courses.add(CourseModel.fromJson(item));
    }

    return courses;
  }

  Future<List<CourseModel>> getCategoryCourses({String id}) async {
    var url = "$baseUrl/courses/category/$id";
    var headers = {
      "Content-Type" : "application/json"
    };

    var response = await http.get(url, headers: headers);
    List data = jsonDecode(response.body)['data'];
    List<CourseModel> courses = [];
    for (var item in data) {
      courses.add(CourseModel.fromJson(item));
    }

    return courses;
  }
}