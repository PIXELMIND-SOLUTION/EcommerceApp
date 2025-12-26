import 'package:ecommerce_app/models/Product/product_model.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;

  /// 🔗 BASE URL FOR IMAGES
  static const String _baseImageUrl = 'http://31.97.206.144:3081';

  const ProductCardWidget({
    super.key,
    required this.product,
    required this.onTap,
  });

  /// 🧠 IMAGE URL RESOLVER
  String get _imageUrl {
    if (product.images.isEmpty) {
      return 'https://via.placeholder.com/300';
    }

    final img = product.images.first.trim();

    if (img.startsWith('http')) {
      return img;
    }

    return '$_baseImageUrl$img';
  }

  @override
  Widget build(BuildContext context) {
    final discountedPrice =
        product.price - (product.price * product.discount / 100);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(_imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        size: 18,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// DETAILS
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.productName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Row(
                      children: [
                        Icon(Icons.star,
                            color: Colors.amber.shade600, size: 14),
                        const SizedBox(width: 4),
                        const Text(
                          "4.5",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text(
                          "₹${discountedPrice.toStringAsFixed(0)}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade600,
                          ),
                        ),
                        const SizedBox(width: 6),
                        if (product.discount > 0)
                          Text(
                            "₹${product.price.toStringAsFixed(0)}",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade500,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
