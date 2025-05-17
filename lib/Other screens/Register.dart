import 'package:flutter/material.dart';
import 'package:maramstore/Other%20screens/Home.dart';
import 'package:maramstore/Other%20screens/Login.dart';
import 'package:maramstore/ThemeProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
            child: Container(
              width: double.infinity,
              height: screenSize.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/register3.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 50),
                          const Text(
                            "🍰Join to the Maram's Sweet Haven family and enjoy the sweetest deals✨",
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'RobotoMono',
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.pinkAccent,
                                  offset: Offset(2, 2),
                                  blurRadius: 3.0,
                                ),
                              ],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Create an account today and unlock sweet deals made just for you🍭",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'RobotoMono',
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.pinkAccent,
                                  offset: Offset(2, 2),
                                  blurRadius: 3.0,
                                ),
                              ],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),

                          // ====== Name ======
                          buildTextField(
                            controller: nameController,
                            label: 'Name',
                            hint: 'Enter your Name',
                            icon: Icons.person,
                            prefixLabel: "Name: ",
                            validator: (value) =>
                                value == null || value.isEmpty ? 'Name is required' : null,
                          ),

                          const SizedBox(height: 20),

                          // ====== Email ======
                          buildTextField(
                            controller: emailController,
                            label: 'Email',
                            hint: 'Enter Your Email',
                            icon: Icons.email,
                            prefixLabel: "Email: ",
                            validator: (value) =>
                                value == null || value.isEmpty || !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)
                                    ? "Enter a valid email"
                                    : null,
                          ),

                          const SizedBox(height: 20),

                          // ====== Password ======
                          TextFormField(
                            controller: passwordController,
                            obscureText: !isPasswordVisible,
                            decoration: buildInputDecoration(
                              label: 'Password',
                              hint: 'Enter A strong Password',
                              icon: Icons.lock,
                              prefixLabel: "Password: ",
                            ).copyWith(
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
                            ),
                            style: getTextFieldStyle(),
                            validator: (value) =>
                                value == null || value.isEmpty ? 'Password is required' : null,
                          ),

                          const SizedBox(height: 20),

                          // ====== Phone ======
                          buildTextField(
                            controller: phoneController,
                            label: 'Phone',
                            hint: 'Enter Your Phone',
                            icon: Icons.phone,
                            prefixLabel: "Phone: ",
                            validator: (value) =>
                                value == null || value.isEmpty || !RegExp(r"^[0-9]{11}$").hasMatch(value)
                                    ? "Enter a valid phone number"
                                    : null,
                          ),

                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    rememberMe = value!;
                                  });
                                },
                                activeColor: Colors.pink,
                              ),
                              const Text(
                                "I agree to all The Terms & Conditions",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const Login(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 160,
                            height: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                backgroundColor: Colors.pinkAccent,
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString('name', nameController.text);
                                  prefs.setString('email', emailController.text);
                                  prefs.setString('password', passwordController.text);
                                  prefs.setString('phone', phoneController.text);
                                  if (rememberMe) {
                                    prefs.setBool('rememberMe', true);
                                  }
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => Home()),
                                  );
                                }
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ✅ زر الوضع الليلي / النهاري
                    Positioned(
                      top: 0,
                      right: 0,
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
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ======== Reusable methods =========

  InputDecoration buildInputDecoration({
    required String label,
    required String hint,
    required IconData icon,
    required String prefixLabel,
  }) {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.white),
      ),
      hintStyle: const TextStyle(
        fontSize: 15,
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
      labelText: label,
      labelStyle: const TextStyle(
          fontStyle: FontStyle.italic, color: Colors.white),
      prefix: Text(
        prefixLabel,
        style: const TextStyle(
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
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.pinkAccent),
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  TextStyle getTextFieldStyle() {
    return const TextStyle(
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
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required String prefixLabel,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: buildInputDecoration(
        label: label,
        hint: hint,
        icon: icon,
        prefixLabel: prefixLabel,
      ),
      style: getTextFieldStyle(),
      validator: validator,
    );
  }
}
