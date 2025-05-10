import 'package:flutter/material.dart';
import 'package:maramstore/Other%20screens/ForgotPasswordPage.dart';
import 'package:maramstore/Other%20screens/Home.dart';
import 'package:maramstore/Other%20screens/Register.dart';
import 'package:maramstore/ThemeProvider.dart';
import 'package:maramstore/enum.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:maramstore/Shared.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool rememberMe = false; // State for checkbox
bool isPasswordVisible = false; // State for password visibility

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      body: Stack(
        children: [
    ColorFiltered(
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
              "assets/images/login.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Welcome Back!👋",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'RobotoMono',
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.pink,
                              offset: Offset(2, 2),
                              blurRadius: 3.0,
                            ),
                          ],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Log in now and treat yourself to the most delicious sweets in seconds🍬🍫",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'RobotoMono',
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.pink,
                              offset: Offset(2, 2),
                              blurRadius: 3.0,
                            ),
                          ],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.pink),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          prefix: const Text("Email: ",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'RobotoMono',
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.pink,
                                    offset: Offset(2, 2),
                                    blurRadius: 3.0,
                                  ),
                                ],
                                fontWeight: FontWeight.bold,
                              )),
                          hintText: 'Enter Your Email',
                          hintStyle: const TextStyle(
                            fontSize: 17,
                            fontFamily: 'RobotoMono',
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            shadows: [
                              Shadow(
                                color: Colors.pink,
                                offset: Offset(2, 2),
                                blurRadius: 3.0,
                              ),
                            ],
                            fontWeight: FontWeight.bold,
                          ),
                          labelText: "Email",
                          labelStyle: const TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              fontSize: 17),
                          prefixIcon:
                              const Icon(Icons.email, color: Colors.pinkAccent),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 17,
                          fontFamily: 'RobotoMono',
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          shadows: [
                            Shadow(
                              color: Colors.pink,
                              offset: Offset(2, 2),
                              blurRadius: 3.0,
                            ),
                          ],
                          fontWeight: FontWeight.bold,
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                  .hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // Password Field
                      TextFormField(
                        controller: passwordController,
                        obscureText: !isPasswordVisible, // Toggle visibility
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.pinkAccent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          prefix: const Text("Password: ",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'RobotoMono',
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.pink,
                                    offset: Offset(2, 2),
                                    blurRadius: 3.0,
                                  ),
                                ],
                                fontWeight: FontWeight.bold,
                              )),
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              fontSize: 17),
                          hintText: 'Enter A strong Password',
                          hintStyle: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'RobotoMono',
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            shadows: [
                              Shadow(
                                color: Colors.pink,
                                offset: Offset(2, 2),
                                blurRadius: 3.0,
                              ),
                            ],
                            fontWeight: FontWeight.bold,
                          ),
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.pinkAccent),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.pink,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 17,
                          fontFamily: 'RobotoMono',
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          shadows: [
                            Shadow(
                              color: Colors.pink,
                              offset: Offset(2, 2),
                              blurRadius: 3.0,
                            ),
                          ],
                          fontWeight: FontWeight.bold,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // Remember Me & Forgot Password Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberMe,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    rememberMe = newValue ?? false;
                                  });
                                },
                              ),
                              const Text(
                                "Remember me",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'RobotoMono',
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Colors.pink,
                                      offset: Offset(2, 2),
                                      blurRadius: 3.0,
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPasswordPage()),
                              );
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'RobotoMono',
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.pink,
                                    offset: Offset(4, 4),
                                    blurRadius: 3.0,
                                  ),
                                ],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Sign In Button
                      MaterialButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final prefs = await SharedPreferences.getInstance();
                            String registeredEmail =
                                prefs.getString('email') ?? '';
                            String registeredPassword =
                                prefs.getString('password') ?? '';

                            if (emailController.text == registeredEmail &&
                                passwordController.text == registeredPassword) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "You don't have an account. Create an account"),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              Future.delayed(const Duration(seconds: 2), () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Register()),
                                );
                              });
                            }
                          }
                        },
                        color:  Colors.pinkAccent,
                        textColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'RobotoMono',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
    );
  }
}
