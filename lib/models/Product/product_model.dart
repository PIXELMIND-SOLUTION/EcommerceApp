class ProductModel {
  final String id;
  final String productName;
  final String categoryName;
  final double price;
  final double discount;
  final List<String> sizes;
  final List<String> colors;
  final int stockQuantity;
  final String description;
  final String suitableFor;
  final List<String> images;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProductModel({
    required this.id,
    required this.productName,
    required this.categoryName,
    required this.price,
    required this.discount,
    required this.sizes,
    required this.colors,
    required this.stockQuantity,
    required this.description,
    required this.suitableFor,
    required this.images,
    this.createdAt,
    this.updatedAt,
  });

  /// 🔒 SAFE FACTORY (handles null & wrong types)
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    double _toDouble(dynamic v) {
      if (v == null) return 0.0;
      if (v is int) return v.toDouble();
      if (v is double) return v;
      return double.tryParse(v.toString()) ?? 0.0;
    }

    int _toInt(dynamic v) {
      if (v == null) return 0;
      if (v is int) return v;
      return int.tryParse(v.toString()) ?? 0;
    }

    List<String> _toStringList(dynamic v) {
      if (v == null) return [];
      if (v is List) {
        return v.map((e) => e.toString()).toList();
      }
      if (v is String) {
        return v
            .split(',')
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toList();
      }
      return [];
    }

    DateTime? _toDate(dynamic v) {
      if (v == null) return null;
      return DateTime.tryParse(v.toString());
    }

    return ProductModel(
      id: json['_id']?.toString() ?? '',
      productName: json['productName']?.toString() ?? '',
      categoryName: json['categoryName']?.toString() ?? '',
      price: _toDouble(json['price']),
      discount: _toDouble(json['discount']),
      sizes: _toStringList(json['size']),
      colors: _toStringList(json['color']),
      stockQuantity: _toInt(json['stockQuantity']),
      description: json['description']?.toString() ?? '',
      suitableFor: json['suitableFor']?.toString() ?? '',
      images: _toStringList(json['images']),
      createdAt: _toDate(json['createdAt']),
      updatedAt: _toDate(json['updatedAt']),
    );
  }
}
