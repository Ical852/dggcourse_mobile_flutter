//@dart=2.9

import 'dart:convert';

import 'package:dggcourses/models/review_model.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:http/http.dart' as http;

class ReviewService {
  
  Future<ReviewModel> giveReview({
    String course_id,
    int rate,
    String text,
    String user_id
  }) async {
    var url = "$baseUrl/review";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = jsonEncode(
      {
        "course_id": course_id,
        "rate": rate,
        "text": text,
        "user_id": user_id
      }
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body
    );
    
    var data = jsonDecode(response.body)['data'];
    ReviewModel review = ReviewModel.fromJson(data);

    return review;
  }
}