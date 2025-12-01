import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ecommerce_app/models/category_model.dart';

class CategoryService {
  static const String url = "http://31.97.206.144:3081/api/admin/allcategories";

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await http.get(Uri.parse(url));


    print('response status code for all categories ${response.statusCode}');
        print('response bodyyyyyyyyy for all categories ${response.body}');

   
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List list = data['categories'];
      return list.map((e) => CategoryModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load categories");
    }
  }
}
