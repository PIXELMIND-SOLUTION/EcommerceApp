import 'package:flutter/material.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Add  Address",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --------- ADDRESS FORM CARD ----------
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildTextField(
                    icon: Icons.person,
                    label: "Full Name",
                    hint: "Enter your name",
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    icon: Icons.phone,
                    label: "Phone Number",
                    hint: "Enter your phone number",
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    icon: Icons.location_on,
                    label: "Address",
                    hint: "House no, street, area",
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    icon: Icons.location_city,
                    label: "City",
                    hint: "Enter your city",
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextField(
                          icon: Icons.pin_drop,
                          label: "Pincode",
                          hint: "6 digits",
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTextField(
                          icon: Icons.map,
                          label: "State",
                          hint: "Enter state",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ---------- ADDRESS TYPE ----------
            // const Text(
            //   "Address Type",
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(height: 10),

            // Row(
            //   children: [
            //     _iconChip(Icons.home, "Home"),
            //     const SizedBox(width: 12),
            //     _iconChip(Icons.work, "Work"),
            //     const SizedBox(width: 12),
            //     _iconChip(Icons.location_city, "Other"),
            //   ],
            // ),
          ],
        ),
      ),

      // ------------- SAVE BUTTON FIXED -------------
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "Save Address",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // ------------------ TEXT FIELD WIDGET ------------------
  Widget _buildTextField({
    required IconData icon,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black87),
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ------------------ ADDRESS TYPE CHIP ------------------
  // Widget _iconChip(IconData icon, String text) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
  //     decoration: BoxDecoration(
  //       color: Colors.grey[200],
  //       borderRadius: BorderRadius.circular(12),
  //     ),
  //     child: Row(
  //       children: [
  //         Icon(icon, size: 18, color: Colors.black),
  //         const SizedBox(width: 8),
  //         Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
  //       ],
  //     ),
  //   );
  // }
}
