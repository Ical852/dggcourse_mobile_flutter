//@dart=2.9

class ToolModel {
  String id;
  String courseId;
  String title;
  String img;

  ToolModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['courseId'];
    title = json['title'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "courseId":courseId,
      "title":title,
      "img": img,
    };
  }
}