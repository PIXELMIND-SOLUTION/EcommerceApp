import 'package:ecommerce_app/helper/storage_helper.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/providers/auth/profile_provider.dart';
import 'package:ecommerce_app/services/category/category_service.dart';
import 'package:ecommerce_app/views/address/address_screen.dart';
import 'package:ecommerce_app/views/category/category_screen.dart';
import 'package:ecommerce_app/views/detail/product_detail_screen.dart';
import 'package:ecommerce_app/views/location/location_screen.dart';
import 'package:ecommerce_app/views/notifications/notification_screen.dart';
import 'package:ecommerce_app/widgets/carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentCarouselIndex = 0;
  String _selectedFlashSaleCategory = 'Newest';
  String? userId;

  List<CategoryModel> _categoriess = [];
  bool _isCategoryLoading = true;

  String? selectedLocation;

  final List<Map<String, dynamic>> _offers = [
    {
      'title': 'Get Special Offer',
      'discount': '40',
      'image':
          'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=800',
    },
    {
      'title': 'Winter Collection',
      'discount': '50',
      'image':
          'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=800',
    },
    {
      'title': 'New Arrivals',
      'discount': '30',
      'image':
          'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=800',
    },
  ];

  //   final List<Map<String, dynamic>> _categories = [
  //   {
  //     'name': 'Clothes',
  //     'image': 'https://www.beyours.in/cdn/shop/files/black-classic-shirt.jpg?v=1744815740',
  //     'color': Colors.red.shade100,
  //   },
  //   {
  //     'name': 'Electronics',
  //     'image': 'https://images-cdn.ubuy.co.in/67c16783dcab667e6d1ef1a8-samsung-32-class-fhd-1080p-smart-led.jpg',
  //     'color': Colors.orange.shade100,
  //   },
  //   {
  //     'name': 'Shoes',
  //     'image': 'https://m.media-amazon.com/images/I/71f3BmjCwtL.jpg',
  //     'color': Colors.pink.shade100,
  //   },
  //   {
  //     'name': 'Watch',
  //     'image': 'https://www.titan.co.in/dw/image/v2/BKDD_PRD/on/demandware.static/-/Sites-titan-master-catalog/default/dwb830e1d4/images/Titan/Catalog/1805QM04_1.jpg?sw=600&sh=600',
  //     'color': Colors.red.shade100,
  //   },
  // ];

  final List<Map<String, dynamic>> _allProducts = [
    {
      'name': 'Wireless Headphones',
      'price': 129.99,
      'oldPrice': 199.99,
      'image':
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
      'rating': 4.5,
      'category': 'Electronics',
      'dateAdded': DateTime(2025, 11, 10),
      'popularity': 850,
    },
    {
      'name': 'Smart Watch Pro',
      'price': 299.99,
      'oldPrice': 399.99,
      'image':
          'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400',
      'rating': 4.8,
      'category': 'Electronics',
      'dateAdded': DateTime(2025, 11, 8),
      'popularity': 1200,
    },
    {
      'name': 'Leather Handbag',
      'price': 89.99,
      'oldPrice': 149.99,
      'image':
          'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=400',
      'rating': 4.3,
      'category': 'Fashion',
      'dateAdded': DateTime(2025, 11, 5),
      'popularity': 650,
    },
    {
      'name': 'Running Shoes',
      'price': 79.99,
      'oldPrice': 119.99,
      'image':
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
      'rating': 4.6,
      'category': 'Shoes',
      'dateAdded': DateTime(2025, 11, 12),
      'popularity': 920,
    },
    {
      'name': 'Sunglasses',
      'price': 59.99,
      'oldPrice': 99.99,
      'image':
          'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=400',
      'rating': 4.2,
      'category': 'Fashion',
      'dateAdded': DateTime(2025, 11, 3),
      'popularity': 580,
    },
    {
      'name': 'Designer Dress',
      'price': 159.99,
      'oldPrice': 249.99,
      'image':
          'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=400',
      'rating': 4.7,
      'category': 'Clothes',
      'dateAdded': DateTime(2025, 11, 14),
      'popularity': 1050,
    },
    {
      'name': 'Casual T-Shirt',
      'price': 29.99,
      'oldPrice': 49.99,
      'image':
          'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400',
      'rating': 4.4,
      'category': 'Clothes',
      'dateAdded': DateTime(2025, 11, 11),
      'popularity': 720,
    },
    {
      'name': 'Denim Jeans',
      'price': 69.99,
      'oldPrice': 99.99,
      'image':
          'https://images.unsplash.com/photo-1542272604-787c3835535d?w=400',
      'rating': 4.5,
      'category': 'Clothes',
      'dateAdded': DateTime(2025, 11, 13),
      'popularity': 890,
    },
  ];

  List<Map<String, dynamic>> get _filteredProducts {
    List<Map<String, dynamic>> products = List.from(_allProducts);

    // Filter by category
    if (_selectedFlashSaleCategory == 'Clothes') {
      products = products.where((p) => p['category'] == 'Clothes').toList();
    }

    // Sort based on selected filter
    if (_selectedFlashSaleCategory == 'Newest') {
      products.sort((a, b) => b['dateAdded'].compareTo(a['dateAdded']));
    } else if (_selectedFlashSaleCategory == 'Popular') {
      products.sort((a, b) => b['popularity'].compareTo(a['popularity']));
    }

    return products;
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<ProfileProvider>(context, listen: false);
      provider.loadUserFromPreferences();
    });
    _loadCategories();
    _loadSavedLocation();
  }

  void _loadSavedLocation() async {
    final savedLocation = await SharedPreferencesHelper.getLocation();
    if (mounted) {
      setState(() {
        selectedLocation = savedLocation;
      });
    }
  }

  void _loadCategories() async {
    try {
      final categories = await CategoryService().fetchCategories();
      setState(() {
        _categoriess = categories;
        _isCategoryLoading = false;
      });
    } catch (e) {
      setState(() {
        _isCategoryLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    _buildSpecialOffersSection(),
                    const SizedBox(height: 24),
                    _buildCategorySection(),
                    const SizedBox(height: 24),
                    _buildFlashSaleSection(),
                    const SizedBox(height: 16),
                    _buildProductGrid(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFF7B3FF2), const Color(0xFF2D1B69)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       'Location',
              //       style: TextStyle(
              //         color: Colors.white.withOpacity(0.8),
              //         fontSize: 12,
              //       ),
              //     ),
              //     const SizedBox(height: 4),
              //     Row(
              //       children: [
              //         Icon(Icons.location_on, color: Colors.white, size: 16),
              //         SizedBox(width: 4),
              //         GestureDetector(
              //           onTap: () async {
              //             final user = await SharedPreferencesHelper.getUser();

              //             final result = await Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) =>
              //                     LocationScreen(userId: user?.id),
              //               ),
              //             );

              //             if (result != null) {
              //               setState(() {
              //                 selectedLocation = result['address'];
              //               });
              //             }
              //           },
              //           child: Text(
              //             selectedLocation ?? 'Choose Location',
              //             style: const TextStyle(
              //               color: Colors.white,
              //               fontSize: 14,
              //               fontWeight: FontWeight.w600,
              //             ),
              //           ),
              //         ),

              //         Icon(
              //           Icons.keyboard_arrow_down,
              //           color: Colors.white,
              //           size: 20,
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              // Flexible(
              //   child: GestureDetector(
              //     onTap: () async {
              //       final user = await SharedPreferencesHelper.getUser();

              //       final result = await Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => LocationScreen(userId: user?.id),
              //         ),
              //       );

              //       if (result != null) {
              //         setState(() {
              //           selectedLocation = result['address'];
              //         });
              //       }
              //     },
              //     child: Text(
              //       selectedLocation ?? 'Choose Location',
              //       softWrap: true,
              //       maxLines: 2,
              //       style: const TextStyle(
              //         color: Colors.white,
              //         fontSize: 14,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //   ),
              // ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location',

                      style: TextStyle(
                        color: const Color.fromARGB(
                          255,
                          255,
                          255,
                          255,
                        ).withOpacity(0.8),
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),

                    GestureDetector(
                      onTap: () async {
                        final user = await SharedPreferencesHelper.getUser();

                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                LocationScreen(userId: user?.id),
                          ),
                        );

                        // if (result != null) {
                        //   setState(() {
                        //     selectedLocation = result['address'];
                        //   });
                        // }

                        if (result != null) {
                          setState(() {
                            selectedLocation = result['address'];
                          });

                          SharedPreferencesHelper.saveLocation(
                            result['address'],
                          );
                        }
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(width: 4),

                          Expanded(
                            child: Text(
                              selectedLocation ?? 'Choose Location',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationScreen(),
                    ),
                  );
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  child: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7B3FF2), Color(0xFF2D1B69)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.tune, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialOffersSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '#SpecialForYou',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // TextButton(onPressed: () {}, child: const Text('See All')),
            ],
          ),
        ),
        const SizedBox(height: 12),
        CarouselWidget(),

        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildCategorySection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CategoryScreen()),
                  );
                },
                child: const Text('See All'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        _isCategoryLoading
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: _categoriess.length,
                  itemBuilder: (context, index) {
                    final category = _categoriess[index];

                    return Container(
                      width: 80,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey.shade200,
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.network(
                              category.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            category.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
      ],
    );
  }

  Widget _buildFlashSaleSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Flash Sale',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              _buildFilterChip('All', _selectedFlashSaleCategory == 'All'),
              _buildFilterChip(
                'Newest',
                _selectedFlashSaleCategory == 'Newest',
              ),
              _buildFilterChip(
                'Popular',
                _selectedFlashSaleCategory == 'Popular',
              ),
              _buildFilterChip(
                'Clothes',
                _selectedFlashSaleCategory == 'Clothes',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool value) {
          if (value) {
            setState(() {
              _selectedFlashSaleCategory = label;
            });
          }
        },
        backgroundColor: Colors.white,
        selectedColor: Colors.deepPurple,
        checkmarkColor: Colors.white,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide(
          color: isSelected
              ? const Color.fromARGB(255, 254, 254, 254)
              : Colors.grey.shade300,
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    final products = _filteredProducts;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.68,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailScreen()),
              );
            },
            child: _buildProductCard(product),
          );
        },
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
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
                      image: NetworkImage(product['image']),
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
                      color: Colors.grey.shade600,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product['name'],
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber.shade600, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        product['rating'].toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          "${product['price']}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          "${product['oldPrice']}",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade500,
                            decoration: TextDecoration.lineThrough,
                          ),
                          overflow: TextOverflow.ellipsis,
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
    );
  }
}
