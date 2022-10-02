//@dart=2.9

import 'dart:convert';

import 'package:dggcourses/models/notification_model.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  
  Future<List<NotificationModel>> getNotifications({String id}) async {
    var url = "$baseUrl/notifications/user/$id";
    var headers = {
      "Content-Type" : "application/json"
    };

    var response = await http.get(url, headers: headers);
    List data = jsonDecode(response.body)['data'];
    List<NotificationModel> notifications = [];
    for (var item in data) {
      notifications.add(NotificationModel.fromJson(item));
    }

    return notifications;
  }

  Future<NotificationModel> createNotifications({
    String date,
    String desc,
    String title,
    String user_id
  }) async {
    var url = "$baseUrl/notifications";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = jsonEncode(
      {
        "date": date,
        "desc": desc,
        "title": title,
        "user_id": user_id
      }
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body
    );

    var data = jsonDecode(response.body)['data'];
    NotificationModel notification = NotificationModel.fromJson(data);

    return notification;
  }
}