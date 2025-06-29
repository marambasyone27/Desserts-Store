import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:maramstore/CartProvider.dart';
import 'package:maramstore/ThemeProvider.dart'; 

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context); 
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 246, 134, 171),
        title: const Text(
          "Cart",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40,
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
        actions: [
          // light and dark mode 
          IconButton(
            icon: Icon(
               isDark ? Icons.nights_stay :Icons.wb_sunny,
              color: Colors.white,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                isDark ? Colors.black.withOpacity(0.4) : Colors.transparent,
                BlendMode.darken,
              ),
              child: Image.asset(
                'assets/images/login1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "You have ${cartProvider.cartItems.length} items in your cart",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cartProvider.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartProvider.cartItems[index];
                    return Card(
                      margin: const EdgeInsets.all(10.0),
                      color: Colors.pink.shade100.withOpacity(0.9),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(item['picture'] ?? ''),
                        ),
                        title: Text(
                          item['name'] ?? "No Title",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "${item['price']} EGP",
                          style: const TextStyle(fontSize: 16),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                           onPressed: () {
     showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Delete an item"),
        content: const Text("Are you sure you want to delete this item?"),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text("Delete"),
            onPressed: () {
              cartProvider.removeFromCart(index);
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
},

                
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
