// import 'package:ecommerce_app/views/detail/product_detail_screen.dart';
// import 'package:flutter/material.dart';

// class CategoryScreen extends StatelessWidget {
//   const CategoryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, dynamic>> products = [
//       {
//         'title': 'Wireless Headphones',
//         'price': 1299,
//         'image':
//             'https://media.istockphoto.com/id/1372906882/photo/modern-blue-wireless-headphones-isolated-on-white-background-with-clipping-path.jpg?s=612x612&w=0&k=20&c=0k-2JFElEQ0QTvXsgtLx3i2JotQo_Eb8aEwyN-BOZjA=',
//         'rating': 4.5,
//       },
//       {
//         'title': 'Smart Watch',
//         'price': 2499,
//         'image':
//             'https://www.titan.co.in/dw/image/v2/BKDD_PRD/on/demandware.static/-/Sites-titan-master-catalog/default/dwb830e1d4/images/Titan/Catalog/1805QM04_1.jpg?sw=600&sh=600',
//         'rating': 4.2,
//       },
//       {
//         'title': 'Running Shoes',
//         'price': 1899,
//         'image': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
//         'rating': 4.7,
//       },
//       {
//         'title': 'Backpack Bag',
//         'price': 999,
//         'image':
//             'https://safaribags.com/cdn/shop/files/3_4bde5165-92cd-4305-b571-dea21fe6568e.jpg?v=1707731843',
//         'rating': 4.3,
//       },
//     ];

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: const Text(
//           "Categories",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: Icon(Icons.arrow_back_ios),
//         ),
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: GridView.builder(
//           itemCount: products.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 0.60,
//             crossAxisSpacing: 12,
//             mainAxisSpacing: 12,
//           ),
//           itemBuilder: (context, index) {
//             final product = products[index];

//             return _buildProductCard(product, context);
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildProductCard(Map<String, dynamic> product, BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => ProductDetailScreen()),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.07),
//               blurRadius: 8,
//               spreadRadius: 1,
//               offset: const Offset(1, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product Image
//             ClipRRect(
//               borderRadius: const BorderRadius.vertical(
//                 top: Radius.circular(16),
//               ),
//               child: Stack(
//                 children: [
//                   AspectRatio(
//                     aspectRatio: 1,
//                     child: Image.network(product['image'], fit: BoxFit.cover),
//                   ),

//                   // Favorite Button
//                   Positioned(
//                     right: 8,
//                     top: 8,
//                     child: CircleAvatar(
//                       radius: 16,
//                       backgroundColor: Colors.white,
//                       child: Icon(
//                         Icons.favorite_border,
//                         color: Colors.redAccent,
//                         size: 18,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // Product Details
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 product['title'],
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14,
//                 ),
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Row(
//                 children: [
//                   const Icon(Icons.star, color: Colors.amber, size: 16),
//                   const SizedBox(width: 4),
//                   Text(
//                     product['rating'].toString(),
//                     style: TextStyle(color: Colors.grey[700], fontSize: 13),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 6),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Text(
//                 "₹${product['price']}",
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF2D1B69),
//                   fontSize: 16,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }
// }












import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/services/category/category_service.dart';
import 'package:ecommerce_app/views/detail/product_detail_screen.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryService = CategoryService();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Categories",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder<List<CategoryModel>>(
          future: categoryService.fetchCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.deepPurple),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            }

            final categories = snapshot.data ?? [];

            if (categories.isEmpty) {
              return const Center(child: Text("No categories found"));
            }

            return GridView.builder(
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.60,
                crossAxisSpacing: 12,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return _buildCategoryCard(categories[index], context);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategoryCard(CategoryModel category, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 8,
              spreadRadius: 1,
              offset: const Offset(1, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  category.image ?? "",
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => const Icon(Icons.image, size: 40),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category.name ?? "No Title",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),

            const Spacer(),

            // const Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.deepPurple),
            // ),
          ],
        ),
      ),
    );
  }
}
