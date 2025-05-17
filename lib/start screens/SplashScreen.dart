import 'dart:async';
import 'package:flutter/material.dart';
import 'package:maramstore/ThemeProvider.dart';
import 'package:maramstore/start screens/Onboarding.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    // Start fade-in
    _controller.forward();

    // Wait, then fade-out, then navigate
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 5), () async {
        if (mounted) {
          // Start fade-out
          await _controller.reverse();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Onboarding()),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // مهم نعمل dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context).isDarkMode;

    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          body: Stack(
            children: [
              // Background image with fade animation
              Positioned.fill(
                child: FadeTransition(
                  opacity: _animation,
                  child: ColorFiltered(
                    colorFilter: isDark
                        ? ColorFilter.mode(
                            Colors.black.withOpacity(0.6),
                            BlendMode.darken,
                          )
                        : const ColorFilter.mode(
                            Colors.transparent,
                            BlendMode.multiply,
                          ),
                    child: Image.asset(
                      "assets/images/Coco Roll.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),

              // Text at the top center
            // Text with fade animation
Positioned(
  top: 14,
  left: 0,
  right: 0,
  child: FadeTransition(
    opacity: _animation,
    child: const Align(
      alignment: Alignment.topCenter,
      child: Text(
        "🍰Welcome to Maram's Sweet Haven🍰",
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 20,
          fontFamily: "Caveat",
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [
            BoxShadow(
              color: Color.fromARGB(255, 242, 34, 19),
              offset: Offset(2, 2),
              blurRadius: 3,
            ),
          ],
        ),
      ),
    ),
  ),
),


              // Theme toggle icon (top right)
              Positioned(
                top: 40,
                right: 20,
                child: IconButton(
                  icon: Icon(
                    isDark ? Icons.nights_stay : Icons.wb_sunny,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}