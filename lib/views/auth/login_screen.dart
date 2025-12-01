// import 'package:ecommerce_app/views/auth/forgot_password.dart';
// import 'package:ecommerce_app/views/auth/signup_screen.dart';
// import 'package:ecommerce_app/views/navbar/navbar_screen.dart';
// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _obscurePassword = true;

//   @override
//   void dispose() {
//     _phoneController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       resizeToAvoidBottomInset: true,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Purple gradient circle background
//             Positioned(
//               top: -100,
//               right: -50,
//               child: Container(
//                 width: 300,
//                 height: 300,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: RadialGradient(
//                     colors: [
//                       const Color(0xFF7B3FF2).withOpacity(0.6),
//                       const Color(0xFF2D1B69).withOpacity(0.3),
//                       Colors.transparent,
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             // Scrollable content
//             SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(
//                   minHeight:
//                       MediaQuery.of(context).size.height -
//                       MediaQuery.of(context).padding.top,
//                 ),
//                 child: IntrinsicHeight(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 120),

//                       // Login title
//                       const Text(
//                         'Login',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 32,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),

//                       const SizedBox(height: 12),

//                       // Sign up link
//                       Row(
//                         children: [
//                           const Text(
//                             "Don't have an account? ",
//                             style: TextStyle(
//                               color: Colors.white70,
//                               fontSize: 14,
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => SignupScreen(),
//                                 ),
//                               );
//                               // Navigate to sign up
//                             },
//                             child: const Text(
//                               'Sign up',
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

//                       // Phone number field
//                       Container(
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF1A1A1A),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: TextField(
//                           controller: _phoneController,
//                           style: const TextStyle(color: Colors.white),
//                           keyboardType: TextInputType.phone,
//                           decoration: InputDecoration(
//                             hintText: '',
//                             hintStyle: const TextStyle(color: Colors.white54),
//                             prefixIcon: Padding(
//                               padding: const EdgeInsets.only(
//                                 left: 15,
//                                 right: 10,
//                               ),
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   const Text(
//                                     '+91',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 8),
//                                   Container(
//                                     width: 1,
//                                     height: 20,
//                                     color: Colors.white24,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             border: InputBorder.none,
//                             contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 15,
//                               vertical: 18,
//                             ),
//                           ),
//                         ),
//                       ),

//                       const SizedBox(height: 20),

//                       // Password field
//                       Container(
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF1A1A1A),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: TextField(
//                           controller: _passwordController,
//                           obscureText: _obscurePassword,
//                           style: const TextStyle(color: Colors.white),
//                           decoration: InputDecoration(
//                             hintText: 'Password',
//                             hintStyle: const TextStyle(color: Colors.white54),
//                             prefixIcon: const Icon(
//                               Icons.lock_outline,
//                               color: Colors.white54,
//                             ),
//                             // suffixIcon: GestureDetector(
//                             //   onTap: () {
//                             //     // Navigate to forgot password
//                             //   },
//                             //   child: const Padding(
//                             //     padding: EdgeInsets.only(right: 15),
//                             //     child: Center(
//                             //       widthFactor: 1,
//                             //       child: Text(
//                             //         'FORGOT',
//                             //         style: TextStyle(
//                             //           color: Color(0xFF7B3FF2),
//                             //           fontSize: 12,
//                             //           fontWeight: FontWeight.w600,
//                             //         ),
//                             //       ),
//                             //     ),
//                             //   ),
//                             // ),
//                             border: InputBorder.none,
//                             contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 15,
//                               vertical: 18,
//                             ),
//                           ),
//                         ),
//                       ),

//                       SizedBox(height: 16),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
//                             },
//                             child: Text(
//                               'Forgot Password',
//                               style: TextStyle(
//                                 color: Color(0xFF7B3FF2),
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 200),

//                       // Login button
//                       Center(
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
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         MainNavigationScreen(),
//                                   ),
//                                 );
//                               },
//                               borderRadius: BorderRadius.circular(30),
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 50,
//                                   vertical: 16,
//                                 ),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: const [
//                                     Text(
//                                       'Login',
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

//                       const SizedBox(height: 40),
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

//   // Widget _buildSocialButton({
//   //   required IconData icon,
//   //   Color? color,
//   //   required VoidCallback onTap,
//   // }) {
//   //   return GestureDetector(
//   //     onTap: onTap,
//   //     child: Container(
//   //       width: 50,
//   //       height: 50,
//   //       decoration: BoxDecoration(
//   //         color: color ?? Colors.white,
//   //         shape: BoxShape.circle,
//   //       ),
//   //       child: Icon(
//   //         icon,
//   //         color: color != null ? Colors.white : Colors.black,
//   //         size: 28,
//   //       ),
//   //     ),
//   //   );
//   // }
// }


















import 'package:ecommerce_app/providers/auth/login_provider.dart';
import 'package:ecommerce_app/views/auth/forgot_password.dart';
import 'package:ecommerce_app/views/auth/signup_screen.dart';
import 'package:ecommerce_app/views/navbar/navbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      final authProvider = Provider.of<LoginProvider>(context, listen: false);

      final success = await authProvider.login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      if (success && mounted) {

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text('Loggin Successfull')));
        // Navigate to home on success
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainNavigationScreen(),
          ),
        );
      } else if (mounted) {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(authProvider.errorMessage ?? 'Login failed'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            // Purple gradient circle background
            Positioned(
              top: -100,
              right: -50,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF7B3FF2).withOpacity(0.6),
                      const Color(0xFF2D1B69).withOpacity(0.3),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Scrollable content
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 120),

                        // Login title
                        const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Sign up link
                        Row(
                          children: [
                            const Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Sign up',
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

                        // Email field
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1A1A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            style: const TextStyle(color: Colors.white),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: const TextStyle(color: Colors.white54),
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: Colors.white54,
                              ),
                              errorStyle: const TextStyle(
                                color: Colors.redAccent,
                                fontSize: 12,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 18,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Password field
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1A1A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            style: const TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: const TextStyle(color: Colors.white54),
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: Colors.white54,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.white54,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                              errorStyle: const TextStyle(
                                color: Colors.redAccent,
                                fontSize: 12,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 18,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgotPassword(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Forgot Password',
                                style: TextStyle(
                                  color: Color(0xFF7B3FF2),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 200),

                        // Login button with loading state
                        Consumer<LoginProvider>(
                          builder: (context, authProvider, child) {
                            return Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF8B5CF6),
                                      Color(0xFF7B3FF2)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF7B3FF2)
                                          .withOpacity(0.4),
                                      blurRadius: 20,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: authProvider.isLoading
                                        ? null
                                        : _handleLogin,
                                    borderRadius: BorderRadius.circular(30),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 50,
                                        vertical: 16,
                                      ),
                                      child: authProvider.isLoading
                                          ? const SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 2,
                                              ),
                                            )
                                          : Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                                Text(
                                                  'Login',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(width: 8),
                                                Icon(
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
                            );
                          },
                        ),

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}