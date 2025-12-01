// // import 'package:flutter/material.dart';

// // class EditProfile extends StatelessWidget {
// //   const EditProfile({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         elevation: 0,
// //         backgroundColor: Colors.white,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: Colors.black),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.symmetric(horizontal: 24),
// //         child: Column(
// //           children: [
// //             const SizedBox(height: 10),

// //             /// ---- Title ----
// //             const Align(
// //               alignment: Alignment.topCenter,
// //               child: Text(
// //                 "Edit Profile",
// //                 style: TextStyle(
// //                   fontSize: 28,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.black,
// //                 ),
// //               ),
// //             ),

// //             const SizedBox(height: 30),

// //             Center(
// //               child: Stack(
// //                 alignment: Alignment.center,
// //                 children: [
// //                   /// Profile Image
// //                   const CircleAvatar(
// //                     radius: 60,
// //                     backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=3"),
// //                   ),

// //                   /// Camera Button
// //                   Positioned(
// //                     bottom: 4,
// //                     right: 4,
// //                     child: GestureDetector(
// //                       onTap: () {
// //                         print("Camera clicked");
// //                       },
// //                       child: Container(
// //                         padding: const EdgeInsets.all(6),
// //                         decoration: const BoxDecoration(
// //                           color: Colors.teal,
// //                           shape: BoxShape.circle,
// //                         ),
// //                         child: const Icon(Icons.camera_alt,
// //                             color: Colors.white, size: 20),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),

// //             const SizedBox(height: 30),

// //             /// ---- DETAILS ----
// //             buildProfileItem("Username", "Melvin"),
// //             buildProfileItem("Email", "melvin@gmail.com"),
// //             buildProfileItem("Phone", "+ 91 9961593179"),
// //             buildProfileItem("Date of birth", "26/09/2002"),
// //             buildProfileItem("Address", "123 Royal Street, New York"),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   /// ---- Reusable row ----
// //   Widget buildProfileItem(String label, String value) {
// //     return Column(
// //       children: [
// //         const SizedBox(height: 18),
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             Text(
// //               label,
// //               style: const TextStyle(
// //                 fontSize: 15,
// //                 color: Colors.grey,
// //               ),
// //             ),
// //             Flexible(
// //               child: Text(
// //                 value,
// //                 textAlign: TextAlign.right,
// //                 style: const TextStyle(
// //                   fontSize: 16,
// //                   color: Colors.black,
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //         const SizedBox(height: 12),
// //         Container(
// //           height: 1,
// //           color: Colors.grey.shade300,
// //         ),
// //       ],
// //     );
// //   }
// // }


















// import 'dart:io';
// import 'package:ecommerce_app/providers/auth/profile_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:image_picker/image_picker.dart';

// class EditProfile extends StatefulWidget {
//   const EditProfile({super.key});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   final ImagePicker _picker = ImagePicker();
//   File? _selectedImage;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final provider = Provider.of<ProfileProvider>(context, listen: false);
//       provider.loadUserFromPreferences();
//     });
//   }

//   Future<void> _pickImage() async {
//     try {
//       final XFile? image = await _picker.pickImage(
//         source: ImageSource.gallery,
//         imageQuality: 80,
//       );

//       if (image != null) {
//         setState(() {
//           _selectedImage = File(image.path);
//         });

//         // Show confirmation dialog
//         if (mounted) {
//           _showUpdateConfirmation();
//         }
//       }
//     } catch (e) {
//       _showErrorSnackBar('Failed to pick image: $e');
//     }
//   }

//   void _showUpdateConfirmation() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Update Profile Picture'),
//         content: const Text('Do you want to update your profile picture?'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 _selectedImage = null;
//               });
//               Navigator.pop(context);
//             },
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               _updateProfile();
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.teal,
//             ),
//             child: const Text('Update'),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _updateProfile() async {
//     if (_selectedImage == null) {
//       _showErrorSnackBar('No image selected');
//       return;
//     }

//     final provider = Provider.of<ProfileProvider>(context, listen: false);
//     final userId = provider.user?.id;

//     if (userId == null) {
//       _showErrorSnackBar('User ID not found');
//       return;
//     }

//     final success = await provider.updateProfile(userId, _selectedImage!.path);

//     if (mounted) {
//       if (success) {
//         _showSuccessSnackBar('Profile updated successfully');
//         setState(() {
//           _selectedImage = null;
//         });
//       } else {
//         _showErrorSnackBar(provider.errorMessage ?? 'Failed to update profile');
//       }
//     }
//   }

//   void _showSuccessSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.green,
//         behavior: SnackBarBehavior.floating,
//       ),
//     );
//   }

//   void _showErrorSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.red,
//         behavior: SnackBarBehavior.floating,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Consumer<ProfileProvider>(
//         builder: (context, provider, child) {
//           if (provider.isLoading) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: Colors.teal,
//               ),
//             );
//           }

//           final user = provider.user;

//           return SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Column(
//               children: [
//                 const SizedBox(height: 10),

//                 /// ---- Title ----
//                 const Align(
//                   alignment: Alignment.topCenter,
//                   child: Text(
//                     "Edit Profile",
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 30),

//                 Center(
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       /// Profile Image
//                       CircleAvatar(
//                         radius: 60,
//                         backgroundImage: _selectedImage != null
//                             ? FileImage(_selectedImage!)
//                             : const NetworkImage("https://i.pravatar.cc/150?img=3")
//                                 as ImageProvider,
//                       ),

//                       /// Camera Button
//                       Positioned(
//                         bottom: 4,
//                         right: 4,
//                         child: GestureDetector(
//                           onTap: _pickImage,
//                           child: Container(
//                             padding: const EdgeInsets.all(6),
//                             decoration: const BoxDecoration(
//                               color: Colors.teal,
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Icon(Icons.camera_alt,
//                                 color: Colors.white, size: 20),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 30),

//                 /// ---- DETAILS ----
//                 buildProfileItem("Username", user?.name ?? "N/A"),
//                 buildProfileItem("Email", user?.email ?? "N/A"),
//                 buildProfileItem("Phone", user?.mobile ?? "N/A"),
//                 // buildProfileItem(
//                 //   "Location",
//                 //   user?.location.coordinates.isNotEmpty == true
//                 //       ? "${user!.location.coordinates[0]}, ${user.location.coordinates[1]}"
//                 //       : "N/A",
//                 // ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   /// ---- Reusable row ----
//   Widget buildProfileItem(String label, String value) {
//     return Column(
//       children: [
//         const SizedBox(height: 18),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               label,
//               style: const TextStyle(
//                 fontSize: 15,
//                 color: Colors.grey,
//               ),
//             ),
//             Flexible(
//               child: Text(
//                 value,
//                 textAlign: TextAlign.right,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 12),
//         Container(
//           height: 1,
//           color: Colors.grey.shade300,
//         ),
//       ],
//     );
//   }
// }













// import 'dart:io';
// import 'package:ecommerce_app/constants/api_constant.dart';
// import 'package:ecommerce_app/providers/auth/profile_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:image_picker/image_picker.dart';

// class EditProfile extends StatefulWidget {
//   const EditProfile({super.key});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   final ImagePicker _picker = ImagePicker();
//   File? _selectedImage;

//   @override
//   void initState() {
//     super.initState();
//     // Load user profile when screen opens
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final provider = Provider.of<ProfileProvider>(context, listen: false);
//       provider.loadUserFromPreferences();
//     });
//   }

//   Future<void> _pickImage() async {
//     try {
//       final XFile? image = await _picker.pickImage(
//         source: ImageSource.gallery,
//         imageQuality: 80,
//       );

//       if (image != null) {
//         setState(() {
//           _selectedImage = File(image.path);
//         });

//         // Show confirmation dialog
//         if (mounted) {
//           _showUpdateConfirmation();
//         }
//       }
//     } catch (e) {
//       _showErrorSnackBar('Failed to pick image: $e');
//     }
//   }

//   void _showUpdateConfirmation() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Update Profile Picture'),
//         content: const Text('Do you want to update your profile picture?'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 _selectedImage = null;
//               });
//               Navigator.pop(context);
//             },
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               _updateProfile();
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.teal,
//             ),
//             child: const Text('Update'),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _updateProfile() async {
//     if (_selectedImage == null) {
//       _showErrorSnackBar('No image selected');
//       return;
//     }

//     final provider = Provider.of<ProfileProvider>(context, listen: false);
//     final userId = provider.user?.id;

//     if (userId == null) {
//       _showErrorSnackBar('User ID not found');
//       return;
//     }

//     final success = await provider.updateProfile(userId, _selectedImage!.path);

//     if (mounted) {
//       if (success) {
//         _showSuccessSnackBar('Profile updated successfully');
//         setState(() {
//           _selectedImage = null;
//         });
//       } else {
//         _showErrorSnackBar(provider.errorMessage ?? 'Failed to update profile');
//       }
//     }
//   }

//   void _showSuccessSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.green,
//         behavior: SnackBarBehavior.floating,
//       ),
//     );
//   }

//   void _showErrorSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.red,
//         behavior: SnackBarBehavior.floating,
//       ),
//     );
//   }


//   Widget _buildProfileImage(String? profileUrl) {
//   ImageProvider imageProvider;

//   if (_selectedImage != null) {
//     imageProvider = FileImage(_selectedImage!);
//   } else if (profileUrl != null && profileUrl.isNotEmpty) {
//     final fullImageUrl = ApiConstants.getImageUrl(profileUrl);
//     imageProvider = NetworkImage(fullImageUrl);
//   } else {
//     // Show default placeholder
//     imageProvider = const NetworkImage("https://i.pravatar.cc/150?img=3");
//   }

//   return CircleAvatar(
//     radius: 60,
//     backgroundImage: imageProvider,
//     onBackgroundImageError: (exception, stackTrace) {
//       // Handle image load error
//       debugPrint('Error loading profile image: $exception');
//     },
//     child: profileUrl == null && _selectedImage == null
//         ? const Icon(Icons.person, size: 60, color: Colors.grey)
//         : null,
//   );
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Consumer<ProfileProvider>(
//         builder: (context, provider, child) {
//           if (provider.isLoading) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: Colors.teal,
//               ),
//             );
//           }

//           final user = provider.user;

//           return SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Column(
//               children: [
//                 const SizedBox(height: 10),

//                 /// ---- Title ----
//                 const Align(
//                   alignment: Alignment.topCenter,
//                   child: Text(
//                     "Edit Profile",
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 30),

//                 Center(
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       /// Profile Image - Now shows actual user profile
//                       _buildProfileImage(user?.profile),

//                       /// Camera Button
//                       Positioned(
//                         bottom: 4,
//                         right: 4,
//                         child: GestureDetector(
//                           onTap: _pickImage,
//                           child: Container(
//                             padding: const EdgeInsets.all(6),
//                             decoration: const BoxDecoration(
//                               color: Colors.teal,
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Icon(Icons.camera_alt,
//                                 color: Colors.white, size: 20),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 30),

//                 /// ---- DETAILS ----
//                 buildProfileItem("Username", user?.name ?? "N/A"),
//                 buildProfileItem("Email", user?.email ?? "N/A"),
//                 buildProfileItem("Phone", user?.mobile ?? "N/A"),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   /// ---- Reusable row ----
//   Widget buildProfileItem(String label, String value) {
//     return Column(
//       children: [
//         const SizedBox(height: 18),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               label,
//               style: const TextStyle(
//                 fontSize: 15,
//                 color: Colors.grey,
//               ),
//             ),
//             Flexible(
//               child: Text(
//                 value,
//                 textAlign: TextAlign.right,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 12),
//         Container(
//           height: 1,
//           color: Colors.grey.shade300,
//         ),
//       ],
//     );
//   }
// }













import 'dart:io';
import 'package:ecommerce_app/constants/api_constant.dart';
import 'package:ecommerce_app/providers/auth/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<ProfileProvider>(context, listen: false);
      provider.loadUserFromPreferences();
    });
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });

        if (mounted) {
          _showUpdateConfirmation();
        }
      }
    } catch (e) {
      _showErrorSnackBar('Failed to pick image: $e');
    }
  }

  void _showUpdateConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Update Profile Picture',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text('Do you want to update your profile picture?'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _selectedImage = null;
              });
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _updateProfile();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00BFA5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _updateProfile() async {
    if (_selectedImage == null) {
      _showErrorSnackBar('No image selected');
      return;
    }

    final provider = Provider.of<ProfileProvider>(context, listen: false);
    final userId = provider.user?.id;

    if (userId == null) {
      _showErrorSnackBar('User ID not found');
      return;
    }

    final success = await provider.updateProfile(userId, _selectedImage!.path);

    if (mounted) {
      if (success) {
        _showSuccessSnackBar('Profile updated successfully');
        setState(() {
          _selectedImage = null;
        });
      } else {
        _showErrorSnackBar(provider.errorMessage ?? 'Failed to update profile');
      }
    }
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: const Color(0xFF4CAF50),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: const Color(0xFFE57373),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  Widget _buildProfileImage(String? profileUrl) {
    ImageProvider imageProvider;

    if (_selectedImage != null) {
      imageProvider = FileImage(_selectedImage!);
    } else if (profileUrl != null && profileUrl.isNotEmpty) {
      final fullImageUrl = ApiConstants.getImageUrl(profileUrl);
      imageProvider = NetworkImage(fullImageUrl);
    } else {
      imageProvider = const NetworkImage("https://i.pravatar.cc/150?img=3");
    }

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00BFA5).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 70,
        backgroundColor: Colors.grey[200],
        backgroundImage: imageProvider,
        onBackgroundImageError: (exception, stackTrace) {
          debugPrint('Error loading profile image: $exception');
        },
        child: profileUrl == null && _selectedImage == null
            ? const Icon(Icons.person, size: 70, color: Colors.grey)
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF2C3E50), size: 20),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Consumer<ProfileProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
                strokeWidth: 3,
              ),
            );
          }

          final user = provider.user;

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),

                // Title Section
                const Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Update your personal information",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 40),

                // Profile Image Section
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _buildProfileImage(user?.profile),

                      // Camera Button with Gradient
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF2D1B69), Color(0xFF2D1B69)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF2D1B69),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // Profile Details Card
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      buildProfileItem(
                        Icons.person_outline_rounded,
                        "Username",
                        user?.name ?? "N/A",
                      ),
                      const SizedBox(height: 20),
                      buildProfileItem(
                        Icons.email_outlined,
                        "Email",
                        user?.email ?? "N/A",
                      ),
                      const SizedBox(height: 20),
                      buildProfileItem(
                        Icons.phone_outlined,
                        "Phone",
                        user?.mobile ?? "N/A",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildProfileItem(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2D1B69), Color(0xFF2D1B69)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 22,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF2C3E50),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}