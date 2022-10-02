//@dart=2.9

class ResourceModel {
  String id;
  String courseId;
  String number;
  String title;
  String source;

  ResourceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['courseId'];
    number = json['number'];
    title = json['title'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "courseId":courseId,
      "number":number,
      "title":title,
      "source": source,
    };
  }
}