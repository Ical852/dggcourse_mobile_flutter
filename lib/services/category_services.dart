//@dart=2.9

import 'dart:convert';

import 'package:dggcourses/models/category_model.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:http/http.dart' as http ;

class CategoryService {
  
  Future<List<CategoryModel>> getCategories() async {
    var url = "$baseUrl/categories";
    var headers = {
      "Content-Type" : "application/json"
    };

    var response = await http.get(url, headers: headers);
    List data = jsonDecode(response.body)['data'];
    List<CategoryModel> categories = [];
    for (var item in data) {
      categories.add(CategoryModel.fromJson(item));
    }

    return categories;
  }
}