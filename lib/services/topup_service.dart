//@dart=2.9

import 'dart:convert';

import 'package:dggcourses/models/topup_model.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:http/http.dart' as http;

class TopUpService {
  
  Future<TopUpModel> topUp({
    String order_id,
    int total,
    String user_id
  }) async {
    var url = "$baseUrl/topup";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = jsonEncode(
      {
        "order_id": order_id,
        "total": total,
        "user_id": user_id
      }
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body
    );

    var data = jsonDecode(response.body)['data'];
    TopUpModel topUp = TopUpModel.fromJson(data);

    return topUp;
  }

  Future<List<TopUpModel>> getAlltopUp({
    String user_id,
  }) async {
    var url = "$baseUrl/topup/user/$user_id";
    var headers = {
      "Content-Type" : "application/json"
    };

    var response = await http.get(
      url,
      headers: headers
    );

    List data = jsonDecode(response.body)['data'];
    List<TopUpModel> topUps = [];
    for (var item in data) {
      topUps.add(TopUpModel.fromJson(item));
    }

    return topUps;
  }
}