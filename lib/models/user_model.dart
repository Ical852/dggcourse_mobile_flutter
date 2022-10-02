//@dart=2.9

class UserModel {
  String id;
  String full_name;
  String email;
  String password;
  String phone_number;
  int dggm;
  String role;
  String interests;
  String img;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    full_name = json['full_name'];
    email = json['email'];
    password = json['password'];
    phone_number = json['phone_number'];
    dggm = json['dggm'];
    role = json['role'];
    interests = json['interests'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "full_name": full_name,
      "email": email,
      "password": password,
      "phone_number": phone_number,
      "dggm": dggm,
      "role": role,
      "interests": interests,
      "img": img,
    };
  }
}