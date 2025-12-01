// import 'package:ecommerce_app/views/auth/login_screen.dart';
// import 'package:flutter/material.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmpasswordController =
//       TextEditingController();

//   bool _passwordVisible = false;
//   bool _confirmPasswordVisible = false;

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmpasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Purple gradient circle
//             Positioned(
//               top: -150,
//               right: -100,
//               child: Container(
//                 width: 400,
//                 height: 400,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: RadialGradient(
//                     colors: [
//                       const Color(0xFF5B2C91).withOpacity(0.8),
//                       const Color(0xFF3D1F5C).withOpacity(0.5),
//                       const Color(0xFF2A1645).withOpacity(0.3),
//                       Colors.transparent,
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             // Scrollable content
//             SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(minHeight: mediaQuery.size.height),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Back button
//                       Padding(
//                         padding: const EdgeInsets.only(top: 20, bottom: 10),
//                         child: Align(
//                           alignment: Alignment.centerLeft,
//                           child: GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: Container(
//                               width: 40,
//                               height: 40,
//                               decoration: BoxDecoration(
//                                 color: Colors.white.withOpacity(0.1),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: const Icon(
//                                 Icons.arrow_back_ios_new,
//                                 color: Colors.white,
//                                 size: 18,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),

//                       const SizedBox(height: 40),

//                       const Text(
//                         'Create account',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 32,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           const Text(
//                             'Already have an account? ',
//                             style: TextStyle(
//                               color: Colors.white70,
//                               fontSize: 14,
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: const Text(
//                               'Sign in',
//                               style: TextStyle(
//                                 color: Color(0xFF7B3FF2),
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 40),

//                       // TEXT FIELDS
//                       _buildTextField(
//                         controller: _nameController,
//                         hintText: 'Name',
//                       ),
//                       const SizedBox(height: 20),

//                       _buildTextField(
//                         controller: _emailController,
//                         hintText: 'Email or phone',
//                       ),
//                       const SizedBox(height: 20),

//                       // PASSWORD FIELD
//                       _buildTextField(
//                         controller: _passwordController,
//                         hintText: 'Password',
//                         isPassword: true,
//                         isVisible: _passwordVisible,
//                         onVisibilityToggle: () {
//                           setState(() {
//                             _passwordVisible = !_passwordVisible;
//                           });
//                         },
//                       ),
//                       const SizedBox(height: 20),

//                       // CONFIRM PASSWORD FIELD
//                       _buildTextField(
//                         controller: _confirmpasswordController,
//                         hintText: 'Confirm Password',
//                         isPassword: true,
//                         isVisible: _confirmPasswordVisible,
//                         onVisibilityToggle: () {
//                           setState(() {
//                             _confirmPasswordVisible = !_confirmPasswordVisible;
//                           });
//                         },
//                       ),

//                       const SizedBox(height: 60),

//                       // Sign-up Button
//                       Align(
//                         alignment: Alignment.topCenter,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             gradient: const LinearGradient(
//                               colors: [Color(0xFF8B5CF6), Color(0xFF7B3FF2)],
//                             ),
//                             borderRadius: BorderRadius.circular(30),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: const Color(0xFF7B3FF2).withOpacity(0.4),
//                                 blurRadius: 20,
//                                 offset: const Offset(0, 8),
//                               ),
//                             ],
//                           ),
//                           child: Material(
//                             color: Colors.transparent,
//                             child: InkWell(
//                               onTap: () {
//                                  Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         LoginScreen(),
//                                   ),
//                                 );
                           
//                               },
//                               borderRadius: BorderRadius.circular(30),
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 40,
//                                   vertical: 16,
//                                 ),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: const [
//                                     Text(
//                                       'Sign up',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                     SizedBox(width: 8),
//                                     Icon(
//                                       Icons.arrow_forward,
//                                       color: Colors.white,
//                                       size: 20,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),

//                       const SizedBox(height: 60),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // UPDATED TEXTFIELD WITH EYE ICON
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hintText,
//     bool isPassword = false,
//     bool isVisible = false,
//     VoidCallback? onVisibilityToggle,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: TextField(
//         controller: controller,
//         obscureText: isPassword ? !isVisible : false,
//         style: const TextStyle(color: Colors.white, fontSize: 16),
//         decoration: InputDecoration(
//           hintText: hintText,
//           hintStyle: TextStyle(
//             color: Colors.white.withOpacity(0.5),
//             fontSize: 15,
//           ),
//           border: InputBorder.none,
//           contentPadding: const EdgeInsets.symmetric(
//             horizontal: 25,
//             vertical: 18,
//           ),
//           suffixIcon: isPassword
//               ? GestureDetector(
//                   onTap: onVisibilityToggle,
//                   child: Icon(
//                     isVisible ? Icons.visibility : Icons.visibility_off,
//                     color: Colors.white.withOpacity(0.6),
//                   ),
//                 )
//               : null,
//         ),
//       ),
//     );
//   }
// }

















import 'package:ecommerce_app/providers/auth/signup_provider.dart';
import 'package:ecommerce_app/views/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignup() async {
    // Validate fields
    if (_nameController.text.trim().isEmpty) {
      _showErrorSnackbar('Please enter your name');
      return;
    }

    if (_emailController.text.trim().isEmpty) {
      _showErrorSnackbar('Please enter your email');
      return;
    }

    if (_mobileController.text.trim().isEmpty) {
      _showErrorSnackbar('Please enter your mobile number');
      return;
    }

    if (_passwordController.text.isEmpty) {
      _showErrorSnackbar('Please enter a password');
      return;
    }

    if (_confirmpasswordController.text.isEmpty) {
      _showErrorSnackbar('Please confirm your password');
      return;
    }

    if (_passwordController.text != _confirmpasswordController.text) {
      _showErrorSnackbar('Passwords do not match');
      return;
    }

    // Call the provider
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    
    final success = await authProvider.register(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text,
      confirmPassword: _confirmpasswordController.text,
      mobile: _mobileController.text.trim(),
    );

    if (success) {
      // Registration successful - navigate to login or home
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration successful! Please login.'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    } else {
      // Show error message
      if (mounted) {
        _showErrorSnackbar(
          authProvider.errorMessage ?? 'Registration failed. Please try again.'
        );
      }
    }
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Purple gradient circle
            Positioned(
              top: -150,
              right: -100,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF5B2C91).withOpacity(0.8),
                      const Color(0xFF3D1F5C).withOpacity(0.5),
                      const Color(0xFF2A1645).withOpacity(0.3),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Scrollable content
            Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: mediaQuery.size.height),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Back button
                              Padding(
                                padding: const EdgeInsets.only(top: 20, bottom: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_back_ios_new,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 40),

                              const Text(
                                'Create account',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Text(
                                    'Already have an account? ',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Sign in',
                                      style: TextStyle(
                                        color: Color(0xFF7B3FF2),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 40),

                              // TEXT FIELDS
                              _buildTextField(
                                controller: _nameController,
                                hintText: 'Name',
                              ),
                              const SizedBox(height: 20),

                              _buildTextField(
                                controller: _emailController,
                                hintText: 'Email',
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(height: 20),

                              _buildTextField(
                                controller: _mobileController,
                                hintText: 'Mobile',
                                keyboardType: TextInputType.phone,
                              ),
                              const SizedBox(height: 20),

                              // PASSWORD FIELD
                              _buildTextField(
                                controller: _passwordController,
                                hintText: 'Password',
                                isPassword: true,
                                isVisible: _passwordVisible,
                                onVisibilityToggle: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              const SizedBox(height: 20),

                              // CONFIRM PASSWORD FIELD
                              _buildTextField(
                                controller: _confirmpasswordController,
                                hintText: 'Confirm Password',
                                isPassword: true,
                                isVisible: _confirmPasswordVisible,
                                onVisibilityToggle: () {
                                  setState(() {
                                    _confirmPasswordVisible = !_confirmPasswordVisible;
                                  });
                                },
                              ),

                              const SizedBox(height: 60),

                              // Sign-up Button
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF8B5CF6), Color(0xFF7B3FF2)],
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF7B3FF2).withOpacity(0.4),
                                        blurRadius: 20,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: authProvider.isLoading ? null : _handleSignup,
                                      borderRadius: BorderRadius.circular(30),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 40,
                                          vertical: 16,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              authProvider.isLoading ? 'Signing up...' : 'Sign up',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            const Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 60),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Loading overlay
                    if (authProvider.isLoading)
                      Container(
                        color: Colors.black.withOpacity(0.5),
                        child: const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF7B3FF2)),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // UPDATED TEXTFIELD WITH EYE ICON
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool isPassword = false,
    bool isVisible = false,
    VoidCallback? onVisibilityToggle,
    TextInputType? keyboardType,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? !isVisible : false,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 15,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 18,
          ),
          suffixIcon: isPassword
              ? GestureDetector(
                  onTap: onVisibilityToggle,
                  child: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white.withOpacity(0.6),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}