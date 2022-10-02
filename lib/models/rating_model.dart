//@dart=2.9

class RatingModel {
  String id;
  String courseId;
  int rating;

  RatingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['courseId'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "courseId":courseId,
      "rating": rating,
    };
  }
}