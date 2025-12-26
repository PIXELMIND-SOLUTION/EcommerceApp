import 'dart:convert';
import 'package:ecommerce_app/models/Product/product_model.dart';
import 'package:http/http.dart' as http;

enum ProductFilter {
  all,
  newest,
  popular,
}

class ProductService {
  static const String _baseUrl =
      'http://31.97.206.144:3081/api/admin/allproducts';

  static Future<List<ProductModel>> fetchProducts(
      ProductFilter filter) async {
    String url = _baseUrl;

    if (filter == ProductFilter.newest) {
      url += '?newest=true';
    } else if (filter == ProductFilter.popular) {
      url += '?isPupular=true';
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to load products');
    }

    final decoded = jsonDecode(response.body);

    if (decoded is! List) {
      throw Exception('Invalid response format');
    }

    return decoded
        .map<ProductModel>((e) => ProductModel.fromJson(e))
        .toList();
  }
}
