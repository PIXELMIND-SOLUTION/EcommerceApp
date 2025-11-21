import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Privacy Policy",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),

      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _sectionTitle("Introduction"),
              _sectionText(
                "Welcome to our e-commerce application. "
                "We respect your privacy and are committed to protecting your personal data. "
                "This Privacy Policy explains how we collect, use, and protect your information."
              ),

              _sectionTitle("Information We Collect"),
              _sectionText(
                "We may collect the following information:\n"
                "• Personal information (Name, Email, Phone number)\n"
                "• Delivery address details\n"
                "• Payment information (processed securely via third-party providers)\n"
                "• Device & usage data (IP address, app interactions)"
              ),

              _sectionTitle("How We Use Your Information"),
              _sectionText(
                "We use your data to:\n"
                "• Process and deliver your orders\n"
                "• Provide customer support\n"
                "• Send notifications about order updates\n"
                "• Improve app performance and user experience\n"
                "• Prevent fraud and ensure security"
              ),

              _sectionTitle("Data Sharing"),
              _sectionText(
                "Your information may be shared with:\n"
                "• Delivery partners\n"
                "• Secure payment gateways\n"
                "• Analytics and fraud-prevention services\n\n"
                "We do not sell your personal data to third parties."
              ),

              _sectionTitle("Data Protection"),
              _sectionText(
                "We use advanced security measures to protect your data. "
                "This includes encryption, secure servers, and restricted access policies. "
                "However, no online system can guarantee 100% security."
              ),

              _sectionTitle("Your Rights"),
              _sectionText(
                "You have the right to:\n"
                "• Access your personal data\n"
                "• Request corrections\n"
                "• Request deletion of your data\n"
                "• Withdraw consent for certain data uses"
              ),

              _sectionTitle("Cookies & Tracking"),
              _sectionText(
                "We use cookies and similar technologies to enhance user experience, "
                "analyze app performance, and deliver personalized content."
              ),

              _sectionTitle("Changes to This Policy"),
              _sectionText(
                "We may update this Privacy Policy from time to time. "
                "Users will be notified about major changes."
              ),

              _sectionTitle("Contact Us"),
              _sectionText(
                "If you have any questions regarding this Privacy Policy, "
                "please contact our support team at:\n\n"
                "support@yourapp.com"
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 6),
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

  Widget _sectionText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        height: 1.5,
        color: Colors.black54,
      ),
    );
  }
}
