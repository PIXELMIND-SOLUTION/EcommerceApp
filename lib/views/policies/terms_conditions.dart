import 'package:flutter/material.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

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
          "Terms & Conditions",
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
                "By using our e-commerce application, you agree to the following "
                "Terms & Conditions. Please read them carefully before using the app."
              ),

              _sectionTitle("Use of the Application"),
              _sectionText(
                "• You must be at least 18 years old to use this application.\n"
                "• You agree not to misuse the app or engage in illegal activities.\n"
                "• You are responsible for maintaining the confidentiality of your account."
              ),

              _sectionTitle("Account Responsibilities"),
              _sectionText(
                "When you create an account, you agree to provide accurate and complete information. "
                "You are responsible for all activities under your account."
              ),

              _sectionTitle("Product Information"),
              _sectionText(
                "We strive to provide accurate product descriptions. However, colors, sizes, or details "
                "may slightly vary. We reserve the right to update product details at any time."
              ),

              _sectionTitle("Orders & Payments"),
              _sectionText(
                "• All orders are subject to availability.\n"
                "• Prices may change without prior notice.\n"
                "• Payments must be made through secure, approved payment methods.\n"
                "• We reserve the right to cancel orders due to stock issues, payment errors, or fraud detection."
              ),

              _sectionTitle("Refund & Cancellation Policy"),
              _sectionText(
                "Refunds and cancellations are handled according to our Refund Policy. "
                "Some products may not be eligible for returns (e.g., digital items, custom products)."
              ),

              _sectionTitle("Shipping & Delivery"),
              _sectionText(
                "Delivery timelines provided are estimates. Delays may occur due to logistics, weather, "
                "or unforeseen circumstances. We are not responsible for delays beyond our control."
              ),

              _sectionTitle("Intellectual Property"),
              _sectionText(
                "All content in the app—including logos, images, product descriptions, and designs—"
                "belongs to our company. Unauthorized use is prohibited."
              ),

              _sectionTitle("User Conduct"),
              _sectionText(
                "You agree not to:\n"
                "• Interfere with the app’s functionality\n"
                "• Upload harmful content or viruses\n"
                "• Misrepresent your identity\n"
                "• Attempt unauthorized access to servers or data"
              ),

              _sectionTitle("Limitation of Liability"),
              _sectionText(
                "We are not liable for:\n"
                "• Losses due to improper app usage\n"
                "• Third-party failures (delivery, payment gateway, etc.)\n"
                "• Damages caused by user errors or misuse"
              ),

              _sectionTitle("Termination"),
              _sectionText(
                "We reserve the right to suspend or terminate your account if you violate these Terms & Conditions "
                "or misuse the platform in any way."
              ),

              _sectionTitle("Changes to Terms"),
              _sectionText(
                "We may update or modify these Terms & Conditions at any time. "
                "Continued use of the app after updates constitutes agreement to the new terms."
              ),

              _sectionTitle("Contact Us"),
              _sectionText(
                "If you have questions regarding these Terms & Conditions, contact us at:\n\n"
                "support@yourapp.com"
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widgets
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
