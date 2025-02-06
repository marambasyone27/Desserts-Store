import 'package:flutter/material.dart';
import 'package:maramstore/Home.dart';
import 'package:maramstore/SplashScreen.dart';
import 'package:provider/provider.dart';
import 'FavouriteProvider.dart'; // Import the Favourite provider
import 'CartProvider.dart'; // Import the Cart provider

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavouriteProvider()), // Favourite provider
        ChangeNotifierProvider(create: (context) => CartProvider()), // Cart provider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maram Store',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
   // home:  Home(), 
    home :const Splashscreen(),
    );
  }
}
