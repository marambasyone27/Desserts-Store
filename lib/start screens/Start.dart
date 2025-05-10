import 'package:flutter/material.dart';
import 'package:maramstore/Other%20screens/Login.dart';
import 'package:maramstore/Other%20screens/Register.dart';
import 'package:maramstore/ThemeProvider.dart';
import 'package:provider/provider.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); 
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
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
                  child:
            // Background Image
            Image.asset(
              "assets/images/strawberryMilkShake2.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
                ),
                  ),
            // Texts and Buttons
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 8), // Space from the top
                child: Column(
                  mainAxisSize: MainAxisSize.max, // Fill available height
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    const Text(
                      "Welcome to a world of delightful flavors! 🍦🎂🍹🍫",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 22,
                        fontFamily: "Caveat",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                            color: Colors.pinkAccent,
                            blurRadius: 1,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),  
                    ),
                    const SizedBox(height: 10), // Space between texts
                    // Text 2
                    const Text(
                      "Discover the perfect blend of sweetness and happiness! 🍦🎂🍹🍫",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 22,
                        fontFamily: "Caveat",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                            color: Colors.pinkAccent,
                            blurRadius: 1,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    // Space between the texts and buttons
                    const SizedBox(height: 400), // Adjust this value to position the buttons higher or lower
                    // Sign In Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Login()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 22,
                          fontFamily: "Caveat",
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Space below the button

                    // Sign Up Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  Register()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 22,
                          fontFamily: "Caveat",
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
      ),
    );
  }
}
