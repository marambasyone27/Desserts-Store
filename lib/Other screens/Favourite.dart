import 'package:flutter/material.dart';
import 'package:maramstore/FavouriteProvider.dart';
import 'package:maramstore/ThemeProvider.dart';
import 'package:provider/provider.dart';

class Favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context); 
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
         actions: [
          // light and dark mode 
         IconButton(
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
        ],
        elevation: 20,
      iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 246, 134, 171),
        title: 
        const Text(
          "Favourites",
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
      body: Stack(
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
              'assets/images/login2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          ),
          
          Column(
            children: [
             
              Expanded(
            child: ListView.builder(
                    itemCount: favouriteProvider.favourites.length,
                    itemBuilder: (context, index) {
                      final item = favouriteProvider.favourites[index];

                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(item['image'] ?? ''),
                          ),
                          title: Text(item['name'] ?? "No Title"),
                          subtitle: Text("${item['price']} EGP"),
                           trailing: Icon(Icons.favorite , color: Colors.red,),
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