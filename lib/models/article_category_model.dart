//@dart=2.9

class ArticleCategoryModel {
  String id;
  String name;

  ArticleCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id" : id,
      "name" : name
    };
  }
}