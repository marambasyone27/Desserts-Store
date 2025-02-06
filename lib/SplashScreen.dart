import 'dart:async';
import 'package:flutter/material.dart';
import 'package:maramstore/Onboarding.dart';
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
      Timer(const Duration(seconds: 7), () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>  Onboarding()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          body: Stack(
            children: [
              // Background image
              Center(
                child: Image.asset(
                 // "assets/images/redberries.jpg",
                 "assets/images/Coco Roll.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              // Text at the top center of the screen
             const Positioned(
                top: 5, // Position from the top of the screen (you can adjust this)
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Welcome to Maram's Sweet Haven",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
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
            ],
          ),
        );
      },
    );
  }
}

