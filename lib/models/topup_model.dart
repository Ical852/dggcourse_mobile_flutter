//@dart=2.9

import 'package:dggcourses/models/user_model.dart';

class TopUpModel {
  String id;
  String order_id;
  String payment_url;
  int total;
  String user_id;
  UserModel user;

  TopUpModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    order_id = json['order_id'];
    payment_url = json['payment_url'];
    total = json['total'];
    user_id = json['user_id'];
    user = UserModel.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id" : id,
      "order_id" : order_id,
      "payment_url" : payment_url,
      "total" : total,
      "user_id" : user_id,
      "user": user.toJson(),
    };
  }
}