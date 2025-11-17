// import 'package:flutter/material.dart';

// class WishlistScreen extends StatefulWidget {
//   const WishlistScreen({super.key});

//   @override
//   State<WishlistScreen> createState() => _WishlistScreenState();
// }

// class _WishlistScreenState extends State<WishlistScreen> {
//   // Sample wishlist data
//   final List<WishlistItem> wishlistItems = [
//     WishlistItem(
//       id: '1',
//       name: 'Premium Wireless Headphones',
//       price: 299.99,
//       originalPrice: 399.99,
//       imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
//       rating: 4.5,
//       inStock: true,
//     ),
//     WishlistItem(
//       id: '2',
//       name: 'Smart Watch Series 8',
//       price: 449.00,
//       originalPrice: 549.00,
//       imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400',
//       rating: 4.8,
//       inStock: true,
//     ),
//     WishlistItem(
//       id: '3',
//       name: 'Designer Leather Backpack',
//       price: 189.99,
//       imageUrl: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400',
//       rating: 4.3,
//       inStock: false,
//     ),
//     WishlistItem(
//       id: '4',
//       name: 'Classic Running Shoes',
//       price: 129.99,
//       originalPrice: 179.99,
//       imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
//       rating: 4.6,
//       inStock: true,
//     ),
//   ];

//   void _removeItem(String id) {
//     setState(() {
//       wishlistItems.removeWhere((item) => item.id == id);
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Item removed from wishlist'),
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }

//   void _addToCart(WishlistItem item) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('${item.name} added to cart'),
//         duration: const Duration(seconds: 2),
//         action: SnackBarAction(
//           label: 'VIEW',
//           onPressed: () {},
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: const Text(
//           'My Wishlist',
//           style: TextStyle(
//             color: Colors.black87,
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         // actions: [
//         //   IconButton(
//         //     icon: const Icon(Icons.share_outlined, color: Colors.black87),
//         //     onPressed: () {},
//         //   ),
//         //   const SizedBox(width: 8),
//         // ],
//       ),
//       body: wishlistItems.isEmpty
//           ? _buildEmptyState()
//           : Column(
//               children: [
//                 _buildHeader(),
//                 Expanded(
//                   child: ListView.builder(
//                     padding: const EdgeInsets.all(16),
//                     itemCount: wishlistItems.length,
//                     itemBuilder: (context, index) {
//                       return _buildWishlistCard(wishlistItems[index]);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }

//   Widget _buildHeader() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       color: Colors.white,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             '${wishlistItems.length} Items',
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               color: Colors.black87,
//             ),
//           ),
//           TextButton.icon(
//             onPressed: () {
//               setState(() {
//                 wishlistItems.clear();
//               });
//             },
//             icon: const Icon(Icons.delete_outline, size: 18),
//             label: const Text('Clear All'),
//             style: TextButton.styleFrom(
//               foregroundColor: Colors.red,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildWishlistCard(WishlistItem item) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Stack(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Product Image
//               ClipRRect(
//                 borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//                 child: Stack(
//                   children: [
//                     Image.network(
//                       item.imageUrl,
//                       height: 200,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                       errorBuilder: (context, error, stackTrace) {
//                         return Container(
//                           height: 200,
//                           color: Colors.grey[300],
//                           child: const Icon(Icons.image, size: 50),
//                         );
//                       },
//                     ),
//                     if (item.originalPrice != null)
//                       Positioned(
//                         top: 12,
//                         left: 12,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                           decoration: BoxDecoration(
//                             color: Colors.red,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Text(
//                             '${((1 - item.price / item.originalPrice!) * 100).round()}% OFF',
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 12,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     if (!item.inStock)
//                       Positioned.fill(
//                         child: Container(
//                           color: Colors.black.withOpacity(0.5),
//                           child: const Center(
//                             child: Text(
//                               'OUT OF STOCK',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//               // Product Details
//               Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       item.name,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black87,
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 8),
//                     Row(
//                       children: [
//                         const Icon(Icons.star, color: Colors.amber, size: 18),
//                         const SizedBox(width: 4),
//                         Text(
//                           item.rating.toString(),
//                           style: const TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black87,
//                           ),
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           '(${(item.rating * 234).round()} reviews)',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 12),
//                     Row(
//                       children: [
//                         Text(
//                           '\$${item.price.toStringAsFixed(2)}',
//                           style: const TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black87,
//                           ),
//                         ),
//                         if (item.originalPrice != null) ...[
//                           const SizedBox(width: 8),
//                           Text(
//                             '\$${item.originalPrice!.toStringAsFixed(2)}',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.grey[500],
//                               decoration: TextDecoration.lineThrough,
//                             ),
//                           ),
//                         ],
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     // Action Buttons
//                     Row(
//                       children: [
//                         Expanded(
//                           child: ElevatedButton.icon(
//                             onPressed: item.inStock ? () => _addToCart(item) : null,
//                             icon: const Icon(Icons.shopping_cart_outlined, size: 20),
//                             label: const Text('Add to Cart'),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.deepPurple,
//                               foregroundColor: Colors.white,
//                               padding: const EdgeInsets.symmetric(vertical: 14),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               elevation: 0,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           // Remove Button
//           Positioned(
//             top: 8,
//             right: 8,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 8,
//                   ),
//                 ],
//               ),
//               child: IconButton(
//                 icon: const Icon(Icons.close, size: 20),
//                 onPressed: () => _removeItem(item.id),
//                 color: Colors.black87,
//                 padding: const EdgeInsets.all(8),
//                 constraints: const BoxConstraints(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildEmptyState() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.favorite_border,
//             size: 100,
//             color: Colors.grey[300],
//           ),
//           const SizedBox(height: 24),
//           const Text(
//             'Your Wishlist is Empty',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.black87,
//             ),
//           ),
//           const SizedBox(height: 12),
//           Text(
//             'Start adding items you love!',
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey[600],
//             ),
//           ),
//           const SizedBox(height: 32),
//           ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.black87,
//               foregroundColor: Colors.white,
//               padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//             child: const Text(
//               'Start Shopping',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class WishlistItem {
//   final String id;
//   final String name;
//   final double price;
//   final double? originalPrice;
//   final String imageUrl;
//   final double rating;
//   final bool inStock;

//   WishlistItem({
//     required this.id,
//     required this.name,
//     required this.price,
//     this.originalPrice,
//     required this.imageUrl,
//     required this.rating,
//     required this.inStock,
//   });
// }












import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  bool selectAllChecked = false;
  final List<WishlistItem> wishlistItems = [
    WishlistItem(
      id: '1',
      name: 'Men\'s Classic Leather Sneaker',
      price: 79.99,
      originalPrice: 99.99,
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
      inStock: true,
      isSelected: false,
      priceDropPercent: 20,
    ),
    WishlistItem(
      id: '2',
      name: 'Smart Home Hub',
      price: 129.00,
      imageUrl: 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=800',
      inStock: true,
      isSelected: false,
      isLowStock: true,
    ),
    WishlistItem(
      id: '3',
      name: 'Wireless Noise-Cancelling Headphones',
      price: 249.50,
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
      inStock: true,
      isSelected: false,
    ),
    WishlistItem(
      id: '4',
      name: 'Organic Cotton Bed Sheets',
      price: 89.99,
      imageUrl: 'https://images.unsplash.com/photo-1631679706909-1844bbd07221?w=400',
      inStock: false,
      isSelected: false,
      notifyWhenAvailable: true,
    ),
  ];

  void toggleSelectAll() {
    setState(() {
      selectAllChecked = !selectAllChecked;
      for (var item in wishlistItems) {
        item.isSelected = selectAllChecked;
      }
    });
  }

  void toggleItemSelection(String id) {
    setState(() {
      final item = wishlistItems.firstWhere((item) => item.id == id);
      item.isSelected = !item.isSelected;
      selectAllChecked = wishlistItems.every((item) => item.isSelected);
    });
  }

  void moveSelectedToCart() {
    final selectedItems = wishlistItems.where((item) => item.isSelected).toList();
    if (selectedItems.isEmpty) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${selectedItems.length} item(s) moved to cart'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void removeItem(String id) {
    setState(() {
      wishlistItems.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedCount = wishlistItems.where((item) => item.isSelected).length;
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () => Navigator.pop(context),
        // ),
        title: Text(
          'My Wishlist',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,

        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.more_vert, color: Colors.black),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Column(
        children: [
          // Sort and Filter Row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.grey[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'Sort By: ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      'Date Added',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.file_upload_outlined, color: Colors.grey[700], size: 20),
              ],
            ),
          ),
          // Select All and Filter Row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[200]!),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: toggleSelectAll,
                  child: Row(
                    children: [
                      Checkbox(
                        value: selectAllChecked,
                        onChanged: (_) => toggleSelectAll(),
                        activeColor: Colors.blue,
                      ),
                      const Text(
                        'Select All',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.tune, color: Colors.grey[700], size: 20),
                    const SizedBox(width: 4),
                    Text(
                      'Filter',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Product List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                return _buildProductCard(wishlistItems[index]);
              },
            ),
          ),
          // Bottom Action Bar
          if (selectedCount > 0)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: selectAllChecked,
                    onChanged: (_) => toggleSelectAll(),
                    activeColor: Colors.blue,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: moveSelectedToCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Move ($selectedCount) to Cart',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        for (var item in wishlistItems) {
                          item.isSelected = false;
                        }
                        selectAllChecked = false;
                      });
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildProductCard(WishlistItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.image, size: 30),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    if (item.priceDropPercent != null)
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Price',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              'Drop',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${item.priceDropPercent}%',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '\$${item.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    if (item.originalPrice != null) ...[
                      const SizedBox(width: 6),
                      Text(
                        '\$${item.originalPrice!.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[500],
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                if (item.inStock && !item.notifyWhenAvailable)
                  Row(
                    children: [
                      if (item.isLowStock)
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.orange[50],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'Low Stock',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      const Icon(Icons.check_circle, color: Colors.green, size: 16),
                      const SizedBox(width: 4),
                      const Text(
                        'In Stock',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                if (!item.inStock && item.notifyWhenAvailable)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Out of Stock - Notify Me When Available',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                const SizedBox(height: 12),
                if (item.inStock)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${item.name} added to cart')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Remove Button
          GestureDetector(
            onTap: () => removeItem(item.id),
            child: Icon(Icons.close, color: Colors.grey[600], size: 20),
          ),
        ],
      ),
    );
  }
}

class WishlistItem {
  final String id;
  final String name;
  final double price;
  final double? originalPrice;
  final String imageUrl;
  final bool inStock;
  bool isSelected;
  final int? priceDropPercent;
  final bool isLowStock;
  final bool notifyWhenAvailable;

  WishlistItem({
    required this.id,
    required this.name,
    required this.price,
    this.originalPrice,
    required this.imageUrl,
    required this.inStock,
    this.isSelected = false,
    this.priceDropPercent,
    this.isLowStock = false,
    this.notifyWhenAvailable = false,
  });
}