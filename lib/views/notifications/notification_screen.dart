import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios)),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.check_circle_outline, color: Colors.black54),
        //     onPressed: () {},
        //     tooltip: 'Mark all as read',
        //   ),
        // ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 400),
            child: _buildNotificationItem(
              icon: Icons.local_shipping_outlined,
              iconColor: Colors.green,
              iconBg: Colors.green.shade50,
              title: 'Order Shipped',
              description: 'Your order #1234 has been shipped and is on the way',
              time: '2 min ago',
              isUnread: true,
            ),
          ),
          FadeInDown(
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 100),
            child: _buildNotificationItem(
              icon: Icons.discount_outlined,
              iconColor: Colors.orange,
              iconBg: Colors.orange.shade50,
              title: 'Special Offer',
              description: 'Get 50% off on electronics. Limited time offer!',
              time: '1 hour ago',
              isUnread: true,
            ),
          ),
          FadeInDown(
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 200),
            child: _buildNotificationItem(
              icon: Icons.check_circle_outline,
              iconColor: Colors.blue,
              iconBg: Colors.blue.shade50,
              title: 'Order Delivered',
              description: 'Your order #1220 has been delivered successfully',
              time: '3 hours ago',
              isUnread: false,
            ),
          ),
          FadeInDown(
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 300),
            child: _buildNotificationItem(
              icon: Icons.credit_card_outlined,
              iconColor: Colors.purple,
              iconBg: Colors.purple.shade50,
              title: 'Payment Successful',
              description: 'Payment of \$299.99 has been processed',
              time: '5 hours ago',
              isUnread: false,
            ),
          ),
          FadeInDown(
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 400),
            child: _buildNotificationItem(
              icon: Icons.favorite_border,
              iconColor: Colors.red,
              iconBg: Colors.red.shade50,
              title: 'Wishlist Item on Sale',
              description: 'Nike Air Max is now 30% off. Don\'t miss out!',
              time: '1 day ago',
              isUnread: false,
            ),
          ),
          FadeInDown(
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 500),
            child: _buildNotificationItem(
              icon: Icons.inventory_2_outlined,
              iconColor: Colors.teal,
              iconBg: Colors.teal.shade50,
              title: 'Order Confirmed',
              description: 'Your order #1198 has been confirmed',
              time: '2 days ago',
              isUnread: false,
            ),
          ),
          FadeInDown(
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 600),
            child: _buildNotificationItem(
              icon: Icons.star_outline,
              iconColor: Colors.amber,
              iconBg: Colors.amber.shade50,
              title: 'Rate Your Purchase',
              description: 'How was your experience with order #1150?',
              time: '3 days ago',
              isUnread: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String description,
    required String time,
    required bool isUnread,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: iconBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: isUnread ? FontWeight.bold : FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          if (isUnread)
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: iconColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}