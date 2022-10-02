//@dart=2.9

class LessonModel {
  String id;
  String courseId;
  String number;
  String title;
  String time;

  LessonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['courseId'];
    number = json['number'];
    title = json['title'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "courseId":courseId,
      "number":number,
      "title":title,
      "time": time,
    };
  }
}