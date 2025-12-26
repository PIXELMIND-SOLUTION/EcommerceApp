import 'package:ecommerce_app/models/Product/product_model.dart';
import 'package:ecommerce_app/services/Product/product_service.dart';
import 'package:flutter/material.dart';


class ProductProvider extends ChangeNotifier {
  List<ProductModel> _products = [];
  bool _loading = false;
  String _error = '';
  ProductFilter _currentFilter = ProductFilter.all;

  List<ProductModel> get products => _products;
  bool get loading => _loading;
  String get error => _error;
  ProductFilter get currentFilter => _currentFilter;

  /// 🔥 LOAD PRODUCTS
  Future<void> loadProducts({ProductFilter filter = ProductFilter.all}) async {
    _loading = true;
    _error = '';
    _currentFilter = filter;
    notifyListeners();

    try {
      _products = await ProductService.fetchProducts(filter);
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  /// 🔁 FILTER SHORTCUTS
  Future<void> loadAll() => loadProducts(filter: ProductFilter.all);
  Future<void> loadNewest() => loadProducts(filter: ProductFilter.newest);
  Future<void> loadPopular() => loadProducts(filter: ProductFilter.popular);
}
