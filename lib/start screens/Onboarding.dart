import 'package:flutter/material.dart';
import 'package:maramstore/Shared.dart';
import 'package:maramstore/ThemeProvider.dart';
import 'package:maramstore/enum.dart';
import 'package:maramstore/start%20screens/Start.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<Onboarding> {
  List<String> images = [
    "assets/images/start5.jpg",
    "assets/images/start.jpg",
    "assets/images/start2.jpg",
    "assets/images/start3.jpg",
    "assets/images/start4.jpg",
  ];

  List<String> texts = [
    "A slice of strawberry cake is like tasting summer—light, fruity, and irresistibly sweet. Fresh strawberries and fluffy cake layers create the ultimate dessert for berry lovers.",
    "Ice cream is the perfect treat to cool you down on a sunny day, with endless flavors to match every mood. Each spoonful of creamy ice cream feels like a sweet hug for your taste buds.",
    "Fresh juice is nature’s way of serving you a refreshing burst of flavor and vitamins in every sip. Whether it's orange, apple, or tropical blends, a glass of juice is the perfect way to energize your day.",
    "A milkshake is a delightful blend of milk and ice cream, made even better with whipped cream and a cherry on top. Sip on a milkshake to instantly feel refreshed and indulge in a creamy, dreamy delight.",
    "Cinnabon’s warm, gooey rolls are a heavenly mix of cinnamon, sugar, and melt-in-your-mouth perfection. Each bite is a symphony of flavors.",
  ];

  bool isLast = false;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
     final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
             // light and dark mode button
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode
                  ? Icons.dark_mode
                  :Icons.light_mode,
              color: Colors.white,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
          TextButton(
            onPressed: () {
              Shared.putBoolean(key: SharedKeys.isLastOnboarding, value: true);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Start()),
                (route) => false,
              );
            },
            child: const Text(
              "Skip",
              style: TextStyle(
                color: Colors.pink,
                fontFamily: 'RobotoMono',
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: images.length,
                onPageChanged: (index) {
                  setState(() {
                    isLast = index == images.length - 1;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          texts[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'RobotoMono',
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SmoothPageIndicator(
                          controller: pageController,
                          count: images.length,
                          effect: const JumpingDotEffect(
                            dotHeight: 12,
                            dotWidth: 12,
                            jumpScale: 1.5,
                            dotColor: Colors.pinkAccent,
                            activeDotColor: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: isLast,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      Shared.putBoolean(
                          key: SharedKeys.isLastOnboarding, value: true);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Start()),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 40),
                      backgroundColor: Colors.pink,
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RobotoMono',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}