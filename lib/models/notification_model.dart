//@dart=2.9

class NotificationModel {
  String id;
  String userId;
  String title;
  String desc;
  String date;

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    desc = json['desc'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "userId":userId,
      "title":title,
      "desc":desc,
      "date": date,
    };
  }
}