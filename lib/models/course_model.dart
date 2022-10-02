//@dart=2.9

import 'package:dggcourses/models/category_model.dart';
import 'package:dggcourses/models/lesson_model.dart';
import 'package:dggcourses/models/mentor_model.dart';
import 'package:dggcourses/models/rating_model.dart';
import 'package:dggcourses/models/resource_model.dart';
import 'package:dggcourses/models/review_model.dart';
import 'package:dggcourses/models/tool_model.dart';

class CourseModel {
  String id;
  String img;
  String title;
  String desc;
  int price;
  String category_id;
  CategoryModel category;
  List<LessonModel> lessons;
  List<ToolModel> tools;
  List<ResourceModel> resources;
  List<ReviewModel> reviews;
  MentorModel mentor;
  RatingModel rating;

  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    title = json['title'];
    desc = json['desc'];
    price = json['price'];
    category_id = json['category_id'];
    category = CategoryModel.fromJson(json['category']);
    lessons = json['lessons'].map<LessonModel>((lesson) => LessonModel.fromJson(lesson)).toList();
    tools = json['tools'].map<ToolModel>((tool) => ToolModel.fromJson(tool)).toList();
    resources = json['resources'].map<ResourceModel>((resource) => ResourceModel.fromJson(resource)).toList();
    reviews = json['reviews'].map<ReviewModel>((review) => ReviewModel.fromJson(review)).toList();
    mentor = MentorModel.fromJson(json['mentor']);
    rating = RatingModel.fromJson(json['rating']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id" : id,
      "img" : img,
      "title" : title,
      "desc" : desc,
      "price" : price,
      "category_id" : category_id,
      "category" : category.toJson(),
      "lessons" : lessons.map((lesson) => lesson.toJson()).toList(),
      "tools" : tools.map((tool) => tool.toJson()).toList(),
      "resources" : resources.map((resource) => resource.toJson()).toList(),
      "reviews" : reviews.map((review) => review.toJson()).toList(),
      "mentor" : mentor.toJson(),
      "rating": rating.toJson(),
    };
  }
}