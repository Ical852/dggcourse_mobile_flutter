//@dart=2.9

class CategoryModel {
  String id;
  String name;
  String img;
  int total_course;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    total_course = json['total_course'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id" : id,
      "name" : name,
      "img" : img,
      "total_course": total_course,
    };
  }
}