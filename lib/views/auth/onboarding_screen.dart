import 'package:ecommerce_app/views/auth/login_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      title: 'The best\nshipping service',
      subtitle: 'We will send all your packages at any time without delay',
      illustration: 1,
    ),
    OnboardingData(
      title: 'Wide range of\ngoods for delivery',
      subtitle: 'We only need a few simple steps to create your order',
      illustration: 2,
    ),
    OnboardingData(
      title: 'Quick and easy\norder creation',
      subtitle: 'Just a few taps and your order is ready for delivery',
      illustration: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_currentPage + 1}/${_pages.length}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      // Skip to last page
                      // _pageController.animateToPage(
                      //   _pages.length - 1,
                      //   duration: const Duration(milliseconds: 400),
                      //   curve: Curves.easeInOut,
                      // );
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return OnboardingPage(data: _pages[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? const Color(0xFF7B3FF2)
                              : Colors.white24,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage < _pages.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                          // Navigate to main app
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7B3FF2),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 8,
                        shadowColor: const Color(0xFF7B3FF2).withOpacity(0.4),
                      ),
                      child: Text(
                        _currentPage < _pages.length - 1 ? 'Next' : 'Get Started',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class OnboardingData {
  final String title;
  final String subtitle;
  final int illustration;

  OnboardingData({
    required this.title,
    required this.subtitle,
    required this.illustration,
  });
}

class OnboardingPage extends StatefulWidget {
  final OnboardingData data;

  const OnboardingPage({super.key, required this.data});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Spacer(),
          FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: SizedBox(
                height: 300,
                child: _buildIllustration(widget.data.illustration),
              ),
            ),
          ),
          const Spacer(),
          FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              children: [
                Text(
                  widget.data.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.data.subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildIllustration(int type) {
    switch (type) {
      case 1:
        return const DeliveryPersonIllustration();
      case 2:
        return const PackageIllustration();
      case 3:
        return const OrderCreationIllustration();
      default:
        return const SizedBox();
    }
  }
}

// Illustration 1: Delivery Person
class DeliveryPersonIllustration extends StatefulWidget {
  const DeliveryPersonIllustration({super.key});

  @override
  State<DeliveryPersonIllustration> createState() =>
      _DeliveryPersonIllustrationState();
}

class _DeliveryPersonIllustrationState extends State<DeliveryPersonIllustration>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -10 * _controller.value),
          child: CustomPaint(
            size: const Size(200, 300),
            painter: DeliveryPersonPainter(),
          ),
        );
      },
    );
  }
}

class DeliveryPersonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw delivery person body
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.3, size.height * 0.4, size.width * 0.4,
            size.height * 0.35),
        const Radius.circular(20),
      ),
      paint,
    );

    // Draw head
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.3),
      size.width * 0.15,
      paint,
    );

    // Draw cap
    paint.color = Colors.black87;
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width * 0.5, size.height * 0.25),
        radius: size.width * 0.18,
      ),
      3.14,
      3.14,
      false,
      paint,
    );

    // Draw package
    paint.color = Colors.brown.shade300;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.15, size.height * 0.5, size.width * 0.25,
            size.height * 0.2),
        const Radius.circular(8),
      ),
      paint,
    );

    // Draw legs
    paint.color = Colors.black87;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.35, size.height * 0.75, size.width * 0.12,
            size.height * 0.15),
        const Radius.circular(8),
      ),
      paint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.53, size.height * 0.75, size.width * 0.12,
            size.height * 0.15),
        const Radius.circular(8),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Illustration 2: Package
class PackageIllustration extends StatefulWidget {
  const PackageIllustration({super.key});

  @override
  State<PackageIllustration> createState() => _PackageIllustrationState();
}

class _PackageIllustrationState extends State<PackageIllustration>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: const Size(200, 300),
          painter: PackagePainter(_controller.value),
        );
      },
    );
  }
}

class PackagePainter extends CustomPainter {
  final double animationValue;

  PackagePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Draw crane arm
    paint.color = Colors.black87;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
            size.width * 0.1, size.height * 0.1, size.width * 0.15, size.height * 0.05),
        const Radius.circular(8),
      ),
      paint,
    );

    // Draw vertical crane support
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
            size.width * 0.15, size.height * 0.1, size.width * 0.05, size.height * 0.3),
        const Radius.circular(8),
      ),
      paint,
    );

    // Draw hanging rope with animation
    paint.strokeWidth = 3;
    paint.style = PaintingStyle.stroke;
    final ropeOffset = 20 * animationValue;
    canvas.drawLine(
      Offset(size.width * 0.175, size.height * 0.4),
      Offset(size.width * 0.175, size.height * 0.5 + ropeOffset),
      paint,
    );

    // Draw package being lifted
    paint.style = PaintingStyle.fill;
    paint.color = Colors.brown.shade400;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.1, size.height * 0.5 + ropeOffset,
            size.width * 0.15, size.height * 0.15),
        const Radius.circular(8),
      ),
      paint,
    );

    // Draw packages on ground
    paint.color = Colors.white;
    for (int i = 0; i < 3; i++) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(size.width * (0.4 + i * 0.2), size.height * 0.7,
              size.width * 0.15, size.height * 0.15),
          const Radius.circular(8),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(PackagePainter oldDelegate) =>
      animationValue != oldDelegate.animationValue;
}

// Illustration 3: Order Creation
class OrderCreationIllustration extends StatefulWidget {
  const OrderCreationIllustration({super.key});

  @override
  State<OrderCreationIllustration> createState() =>
      _OrderCreationIllustrationState();
}

class _OrderCreationIllustrationState extends State<OrderCreationIllustration>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: const Size(200, 300),
          painter: OrderCreationPainter(_controller.value),
        );
      },
    );
  }
}

class OrderCreationPainter extends CustomPainter {
  final double animationValue;

  OrderCreationPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Draw three order cards
    for (int i = 0; i < 3; i++) {
      final yOffset = (i - 1) * size.height * 0.25;
      final opacity = (1 - (animationValue - i * 0.33).abs().clamp(0, 1));

      paint.color = Colors.white.withOpacity(0);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(size.width * 0.25, size.height * 0.35 + yOffset,
              size.width * 0.5, size.height * 0.2),
          const Radius.circular(16),
        ),
        paint,
      );

      // Draw package icon on card
      paint.color = const Color(0xFFFFC629).withOpacity(0);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(size.width * 0.35, size.height * 0.4 + yOffset,
              size.width * 0.1, size.height * 0.1),
          const Radius.circular(8),
        ),
        paint,
      );
    }

    // Draw hand/cursor
    paint.color = const Color.fromARGB(221, 255, 255, 255);
    final handX = size.width * 0.5 + size.width * 0.15 * animationValue;
    final handY = size.height * 0.55;

    // Draw finger
    canvas.drawCircle(Offset(handX, handY), size.width * 0.08, paint);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(handX - size.width * 0.03, handY, size.width * 0.06,
            size.height * 0.08),
        const Radius.circular(8),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(OrderCreationPainter oldDelegate) =>
      animationValue != oldDelegate.animationValue;
}