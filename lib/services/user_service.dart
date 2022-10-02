//@dart=2.9

import 'dart:convert';

import 'package:dggcourses/models/user_model.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:http/http.dart' as http;

class UserService {
  
  Future<UserModel> login({
    String email,
    String password
  }) async {
    var url = "$baseUrl/user/login";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = jsonEncode(
      {
        "email" : email,
        "password" : password
      }
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body
    );

    var data = jsonDecode(response.body)['data'];
    UserModel user = UserModel.fromJson(data);

    return user;
  }

  Future<UserModel> register({
    String email,
    String full_name,
    String password,
    String phone_number,
  }) async {
    var url = "$baseUrl/user/register";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = jsonEncode(
      {
        "email": email,
        "full_name": full_name,
        "password": password,
        "phone_number": phone_number
      }
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body
    );

    var data = jsonDecode(response.body)['data'];
    UserModel user = UserModel.fromJson(data);

    return user;
  }

  Future<UserModel> fetch({
    String user_id,
  }) async {
    var url = "$baseUrl/user/$user_id";
    var headers = {
      "Content-Type" : "application/json"
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    var data = jsonDecode(response.body)['data'];
    UserModel user = UserModel.fromJson(data);

    return user;
  }

  Future<UserModel> updateDggm({
    UserModel userData,
    int dggm
  }) async {
    var url = "$baseUrl/user/${userData.id}?type=dggm";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = jsonEncode(
      {
        "full_name": userData.full_name,
        "phone_number": userData.phone_number,
        "password": userData.password,
        "dggm": dggm,
        "role": userData.role,
        "interests": userData.interests
      }
    );

    var response = await http.put(
      url,
      headers: headers,
      body: body
    );

    var data = jsonDecode(response.body)['data'];
    UserModel user = UserModel.fromJson(data);

    return user;
  }

  Future<UserModel> updateProfile({
    UserModel userData,
    String full_name,
    String phone_number
  }) async {
    var url = "$baseUrl/user/${userData.id}?type=profile";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = jsonEncode(
      {
        "full_name": full_name,
        "phone_number": phone_number,
        "password": userData.password,
        "dggm": userData.dggm,
        "role": userData.role,
        "interests": userData.interests
      }
    );

    var response = await http.put(
      url,
      headers: headers,
      body: body
    );

    var data = jsonDecode(response.body)['data'];
    UserModel user = UserModel.fromJson(data);

    return user;
  }

  Future<UserModel> updatePassword({
    UserModel userData,
    String password
  }) async {
    var url = "$baseUrl/user/${userData.id}?type=password";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = jsonEncode(
      {
        "full_name": userData.full_name,
        "phone_number": userData.phone_number,
        "password": password,
        "dggm": userData.dggm,
        "role": userData.role,
        "interests": userData.interests
      }
    );

    var response = await http.put(
      url,
      headers: headers,
      body: body
    );

    var data = jsonDecode(response.body)['data'];
    UserModel user = UserModel.fromJson(data);

    return user;
  }

  Future<UserModel> updateRole({
    UserModel userData,
    String role
  }) async {
    var url = "$baseUrl/user/${userData.id}?type=role";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = jsonEncode(
      {
        "full_name": userData.full_name,
        "phone_number": userData.phone_number,
        "password": userData.password,
        "dggm": userData.dggm,
        "role": role,
        "interests": userData.interests
      }
    );

    var response = await http.put(
      url,
      headers: headers,
      body: body
    );

    var data = jsonDecode(response.body)['data'];
    UserModel user = UserModel.fromJson(data);

    return user;
  }

  Future<UserModel> updateInterest({
    UserModel userData,
    String interests
  }) async {
    var url = "$baseUrl/user/${userData.id}?type=interest";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = jsonEncode(
      {
        "full_name": userData.full_name,
        "phone_number": userData.phone_number,
        "password": userData.password,
        "dggm": userData.dggm,
        "role": userData.role,
        "interests": interests
      }
    );

    var response = await http.put(
      url,
      headers: headers,
      body: body
    );

    var data = jsonDecode(response.body)['data'];
    UserModel user = UserModel.fromJson(data);

    return user;
  }
}