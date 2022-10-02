//@dart=2.9

import 'dart:convert';

import 'package:dggcourses/models/rating_model.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:http/http.dart' as http;

class RatingService {
  
  Future<RatingModel> giveRating({
    String course_id,
    int rating
  }) async {
    var url = "$baseUrl/rating";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = jsonEncode(
      {
        "course_id": course_id,
        "rating" : 1
      }
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body
    );

    var data = jsonDecode(response.body)['data'];
    RatingModel rating = RatingModel.fromJson(data);

    return rating;
  }
}