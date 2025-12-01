import 'package:ecommerce_app/providers/auth/login_provider.dart';
import 'package:ecommerce_app/providers/auth/profile_provider.dart';
import 'package:ecommerce_app/views/Reviews/review_screen.dart';
import 'package:ecommerce_app/views/address/address_screen.dart';
import 'package:ecommerce_app/views/auth/login_screen.dart';
import 'package:ecommerce_app/views/coupoun/coupoun_screen.dart';
import 'package:ecommerce_app/views/home/wishlist_screen.dart';
import 'package:ecommerce_app/views/notifications/notification_screen.dart';
import 'package:ecommerce_app/views/orders/order_detail_screen.dart';
import 'package:ecommerce_app/views/policies/help_screen.dart';
import 'package:ecommerce_app/views/policies/privacy_policy.dart';
import 'package:ecommerce_app/views/policies/terms_conditions.dart';
import 'package:ecommerce_app/views/profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text(
            "Logout",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              onPressed: () async {
                Navigator.pop(context); // Close dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,

                    content: Text('Logout Successfully'),
                  ),
                );
                await Provider.of<LoginProvider>(
                  context,
                  listen: false,
                ).logout();

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false,
                );
              },
              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileProvider>(
        context,
        listen: false,
      ).loadUserFromPreferences();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Profile Header
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black12.withOpacity(0.05),
                  ),
                ],
              ),
              child: Consumer<ProfileProvider>(
                builder: (context, provider, child) {
                  final user = provider.user;

                  // Construct full image URL
                  String getFullImageUrl(String? profilePath) {
                    if (profilePath == null || profilePath.isEmpty) {
                      return "https://i.pravatar.cc/150?img=3";
                    }

                    if (profilePath.startsWith('http://') ||
                        profilePath.startsWith('https://')) {
                      return profilePath;
                    }

                    // Replace with your actual backend URL
                    const String baseUrl =
                        'http://31.97.206.144:3081'; // Change this!
                    return '$baseUrl/$profilePath';
                  }

                  return Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.deepPurple.shade100,
                        backgroundImage: NetworkImage(
                          getFullImageUrl(user?.profile),
                        ),
                        onBackgroundImageError: (exception, stackTrace) {
                          debugPrint('Error loading profile image: $exception');
                        },
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user?.name ?? "N/A",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              user?.email ?? "N/A",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              user?.mobile ?? "N/A",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Profile Options
            buildSectionTitle("Account"),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderDetailScreen()),
                );
              },

              child: buildMenuTile(Icons.shopping_bag, "My Orders"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile()),
                );
              },
              child: buildMenuTile(Icons.person, "Edit Profile"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WishlistScreen()),
                );
              },
              child: buildMenuTile(Icons.favorite, "Wishlist"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddressScreen()),
                );
              },
              child: buildMenuTile(Icons.location_on, "My Addresses"),
            ),
            // buildMenuTile(Icons.credit_card, "Payment Methods"),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CouponScreen()),
                );
              },
              child: buildMenuTile(Icons.local_offer, "Coupons"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReviewScreen()),
                );
              },
              child: buildMenuTile(Icons.star, "Reviews"),
            ),

            const SizedBox(height: 10),

            buildSectionTitle("Settings"),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
              child: buildMenuTile(Icons.notifications, "Notifications"),
            ),
            // buildMenuTile(Icons.language, "Language"),
            // buildMenuTile(Icons.brightness_6, "Theme Mode"),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicy()),
                );
              },
              child: buildMenuTile(Icons.privacy_tip, "Privacy Policy"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsConditions()),
                );
              },
              child: buildMenuTile(Icons.description, "Terms & Conditions"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpScreen()),
                );
              },
              child: buildMenuTile(Icons.help_center, "Help & Support"),
            ),

            const SizedBox(height: 20),

            // Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  _showLogoutDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Section Header Widget
  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  // Menu Tile Widget
  Widget buildMenuTile(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        // onTap: () {},
      ),
    );
  }
}
