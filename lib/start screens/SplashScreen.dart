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

class _SplashScreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 5), () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Onboarding()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context).isDarkMode;

    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          body: Stack(
            children: [
              // Background image with optional dark overlay
              Positioned.fill(
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

              // Text at the top center
              const Positioned(
                top: 14,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "🍰Welcome to Sweet Haven store🍰",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 23,
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

              // Theme toggle icon (top right)
              Positioned(
                top: 40,
                right: 20,
                child: IconButton(
                  icon: Icon(
                    isDark ? Icons.nights_stay :Icons.wb_sunny,
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
