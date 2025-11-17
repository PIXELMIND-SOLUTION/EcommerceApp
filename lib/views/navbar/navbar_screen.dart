// // ignore_for_file: deprecated_member_use

// import 'package:ecommerce_app/views/home/cart_screen.dart';
// import 'package:ecommerce_app/views/home/home_screen.dart';
// import 'package:ecommerce_app/views/home/profile_screen.dart';
// import 'package:ecommerce_app/views/home/wishlist_screen.dart';
// import 'package:flutter/material.dart';

// class MainNavigationScreen extends StatefulWidget {
//   const MainNavigationScreen({Key? key}) : super(key: key);

//   @override
//   State<MainNavigationScreen> createState() => _MainNavigationScreenState();
// }

// class _MainNavigationScreenState extends State<MainNavigationScreen> {
//   int _currentIndex = 0;

//   final List<Widget> _screens = [
//     HomeScreen(),
//     WishlistScreen(),
//     CartScreen(),
//     ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_currentIndex],
//       bottomNavigationBar: Container(
//         color: Colors.transparent,
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
//             child: Container(
//               height: 65,
//               decoration: BoxDecoration(
//                 color: const Color(0xFF5B2C91).withOpacity(0.8),
//                 borderRadius: BorderRadius.circular(35),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.3),
//                     blurRadius: 20,
//                     offset: const Offset(0, 5),
//                   ),
//                 ],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     _buildNavItem(
//                       index: 0,
//                       icon: Icons.home_rounded,
//                     ),
//                     _buildNavItem(
//                       index: 1,
//                       icon: Icons.favorite_rounded,
//                     ),
//                     _buildNavItem(
//                       index: 2,
//                       icon: Icons.shopping_bag_rounded,
//                     ),
//                     _buildNavItem(
//                       index: 3,
//                       icon: Icons.person_rounded,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildNavItem({
//     required int index,
//     required IconData icon,
//   }) {
//     final isSelected = _currentIndex == index;

//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _currentIndex = index;
//         });
//       },
//       behavior: HitTestBehavior.opaque,
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.white : Colors.transparent,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Icon(
//           icon,
//           color: isSelected ? const Color(0xFF1E1E1E) : Colors.grey.shade400,
//           size: 26,
//         ),
//       ),
//     );
//   }
// }












// ignore_for_file: deprecated_member_use



import 'package:ecommerce_app/views/home/cart_screen.dart';
import 'package:ecommerce_app/views/home/home_screen.dart';
import 'package:ecommerce_app/views/home/profile_screen.dart';
import 'package:ecommerce_app/views/home/wishlist_screen.dart';
import 'package:flutter/material.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF7B3FF2),
                    Color(0xFF2D1B69),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF7B3FF2).withOpacity(0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(
                      index: 0,
                      icon: Icons.home_rounded,
                    ),
                    _buildNavItem(
                      index: 1,
                      icon: Icons.favorite_rounded,
                    ),
                    _buildNavItem(
                      index: 2,
                      icon: Icons.shopping_bag_rounded,
                    ),
                    _buildNavItem(
                      index: 3,
                      icon: Icons.person_rounded,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
  }) {
    final isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icon,
          color: isSelected ? const Color(0xFF7B3FF2) : Colors.white.withOpacity(0.6),
          size: 26,
        ),
      ),
    );
  }
}