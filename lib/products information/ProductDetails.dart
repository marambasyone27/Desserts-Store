import 'package:flutter/material.dart';
import 'package:maramstore/ThemeProvider.dart';
import 'package:provider/provider.dart';
import 'package:maramstore/CartProvider.dart';

class ProductDetails extends StatefulWidget {
  final String name;
  final String picture;
  final String price;

  const ProductDetails({
    Key? key,
    required this.name,
    required this.picture,
    required this.price,
  }) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  double userRating = 0.0;

      @override
  Widget build(BuildContext context) {
       final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 175, 128, 111),
                      Color.fromARGB(255, 215, 47, 103),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
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
        ],
        iconTheme: IconThemeData(color: Colors.white),
        shadowColor: Colors.pink,
        title: Text(
          widget.name,
           style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                      fontFamily: "Caveat",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          color: Colors.pink,
                          offset: Offset(2, 2),
                          blurRadius: 3,
                        ),

                      ],
                    ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 16),
            ClipOval(
              child: Image.asset(
                widget.picture,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Price: ${widget.price}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
            const SizedBox(height: 20),
             // Rating Section
             SingleChildScrollView(
                scrollDirection: Axis.horizontal,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Rate this product: ",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.pinkAccent),
                ),
               // const SizedBox(width: 6),
                ...List.generate(5, (index) {
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        userRating = index + 1.0;
                      });
                    },
                    icon: Icon(
                      index < userRating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 25,
                    ),
                  );
                }),
              ],
            ),
             ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    
                  SnackBar(
                    duration: const Duration(seconds: 3),
                    backgroundColor: const Color.fromARGB(255, 246, 134, 171),
                    content: Text("Thanks for rating! Your rating: $userRating⭐" ,style:  const TextStyle(color: Colors.white , fontSize: 18 , fontWeight: FontWeight.bold ,)),
                  ),
                );
              },
              child: const Text("Submit Rating" , style: TextStyle(color: Colors.white , fontSize: 18 , fontWeight: FontWeight.bold , ), ),
            ),

            const SizedBox(height: 20),
          
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).addToCart(
                  widget.name,
                  widget.picture,
                  widget.price,
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text("good! The product has been added to the cart successfully ✅"),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text(
                "Add to Cart",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
