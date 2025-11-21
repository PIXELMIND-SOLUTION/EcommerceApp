import 'package:ecommerce_app/views/Reviews/review_screen.dart';
import 'package:ecommerce_app/views/address/address_screen.dart';
import 'package:ecommerce_app/views/home/wishlist_screen.dart';
import 'package:ecommerce_app/views/notifications/notification_screen.dart';
import 'package:ecommerce_app/views/orders/order_detail_screen.dart';
import 'package:ecommerce_app/views/policies/help_screen.dart';
import 'package:ecommerce_app/views/policies/privacy_policy.dart';
import 'package:ecommerce_app/views/policies/terms_conditions.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.deepPurple.shade100,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?img=3",
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Melvin",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "melvin@gmail.com",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "+91 9876543210",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WishlistScreen()));
              },
              child: buildMenuTile(Icons.favorite, "Wishlist")),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressScreen()));
              },
              child: buildMenuTile(Icons.location_on, "My Addresses")),
            buildMenuTile(Icons.credit_card, "Payment Methods"),
            buildMenuTile(Icons.local_offer, "Coupons"),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewScreen()));
              },
              child: buildMenuTile(Icons.star, "Reviews")),

            const SizedBox(height: 10),

            buildSectionTitle("Settings"),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
              },
              child: buildMenuTile(Icons.notifications, "Notifications")),
            // buildMenuTile(Icons.language, "Language"),
            // buildMenuTile(Icons.brightness_6, "Theme Mode"),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicy()));
              },
              child: buildMenuTile(Icons.privacy_tip, "Privacy Policy")),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsConditions()));
              },
            child: buildMenuTile(Icons.description, "Terms & Conditions")),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpScreen()));
              },
              child: buildMenuTile(Icons.help_center, "Help & Support")),

            const SizedBox(height: 20),

            // Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {},
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
