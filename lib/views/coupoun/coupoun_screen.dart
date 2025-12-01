import 'package:flutter/material.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Available Coupons",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios)),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _couponCard(
            color: Colors.blue,
            title: "FLAT 20% OFF",
            subtitle: "For orders above ₹999",
            code: "SAVE20",
            expiry: "Expires on 31 Dec",
          ),
          const SizedBox(height: 16),
          _couponCard(
            color: Colors.green,
            title: "₹150 OFF",
            subtitle: "On minimum purchase of ₹699",
            code: "SHOP150",
            expiry: "Valid till 25 Dec",
          ),
          const SizedBox(height: 16),
          _couponCard(
            color: Colors.red,
            title: "BUY 1 GET 1",
            subtitle: "Applicable on selected items",
            code: "BOGO",
            expiry: "Valid this week",
          ),
          const SizedBox(height: 16),
          _couponCard(
            color: Colors.orange,
            title: "FLAT ₹200 OFF",
            subtitle: "Only for new users",
            code: "NEW200",
            expiry: "Valid till 31 Dec",
          ),
        ],
      ),
    );
  }

  // ---------------------- COUPON CARD ----------------------
  Widget _couponCard({
    required Color color,
    required String title,
    required String subtitle,
    required String code,
    required String expiry,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left color tag
          Container(
            width: 6,
            height: 80,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          const SizedBox(width: 16),

          // Text Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        code,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      expiry,
                      style: TextStyle(color: Colors.red[600], fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Apply Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Apply",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
