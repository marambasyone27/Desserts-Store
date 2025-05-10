import 'package:flutter/material.dart';
import 'package:maramstore/Other%20screens/Home.dart';
import 'package:maramstore/Other%20screens/Login.dart';
import 'package:provider/provider.dart';
import 'FavouriteProvider.dart';
import 'CartProvider.dart';
import 'ThemeProvider.dart';
import 'start screens/SplashScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavouriteProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()), 
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maram Store',
      theme: ThemeData(
      iconTheme: IconThemeData(color: Colors.white),
        brightness: Brightness.light,
        primarySwatch: Colors.pink,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.pink,
      ),
      themeMode: themeProvider.themeMode, 

      home: Splashscreen(),
      //home: Home(),
    );
  }
}
