import 'package:flutter/material.dart';
import 'package:maramstore/ThemeProvider.dart';
import 'package:provider/provider.dart';

class ContactUs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
        final themeProvider = Provider.of<ThemeProvider>(context); 
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        actions: [
          // light and dark mode 
          IconButton(
            icon: Icon(
              isDark ? Icons.dark_mode : Icons.light_mode,
              color: Colors.white,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          )
        ],
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 246, 134, 171),
        title: 
        const Text(
          "Contact Us",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontFamily: 'Caveat',
            fontStyle: FontStyle.italic,
            shadows: [
              Shadow(
                color: Colors.pink,
                offset: Offset(4, 4),
                blurRadius: 3,
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, 
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child:  ColorFiltered(
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
                  Image.asset(
                    "assets/images/strawberry2.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
            ),
                Center(
                  child: Container(
                    width: 320,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 228, 139, 169),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "✨Get In Touch With Us✨",
                            style: TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'Caveat',
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
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
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.pinkAccent),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Name',
                              labelStyle: const TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.pink,
                              ),
                              hintText: "Enter your name",
                              hintStyle: const TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                              ),
                              prefixText: "Name:",
                              prefixStyle: const TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
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
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.pinkAccent),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Email',
                              labelStyle: const TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.pink,
                              ),
                              hintText: "Enter your email",
                              hintStyle: const TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                              ),
                              prefixText: "Email:",
                              prefixStyle: const TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
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
                          const SizedBox(height: 10),
                          TextFormField(
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
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
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.pinkAccent),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Phone',
                              labelStyle: const TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                              prefixIcon: const Icon(
                                Icons.phone,
                                color: Colors.pink,
                              ),
                              hintText: "Enter your phone",
                              hintStyle: const TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                              ),
                              prefixText: "Phone:",
                              prefixStyle: const TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !RegExp(r"^[0-9]{11}$").hasMatch(value)) {
                                return "Enter a valid phone number";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
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
                            maxLines: 5,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.pinkAccent),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Message',
                              labelStyle: const TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                              prefixIcon: const Icon(
                                Icons.message,
                                color: Colors.pink,
                              ),
                              hintText: "Enter your message",
                              hintStyle: const TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                              ),
                              prefixText: "Message:",
                              prefixStyle: const TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return " Message is required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 246, 134, 171),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Send",
                              style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 3),
                                    content: Text(
                                        "Thanks for reaching out! Our team will contact you shortly. Have a great day!"),
                                    backgroundColor:
                                        Color.fromARGB(255, 246, 134, 171),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 40,
            color: Color.fromARGB(255, 246, 134, 171),
            alignment: Alignment.center,
            child: const Text(
              "Copyright © 2025 Sweet Haven. All rights reserved.",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'Caveat',
                fontStyle: FontStyle.italic,
                shadows: [
                  Shadow(
                    color: Colors.pink,
                    offset: Offset(2, 2),
                    blurRadius: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
