import 'package:flutter/material.dart';
import 'package:maramstore/FavouriteProvider.dart';
import 'package:maramstore/ThemeProvider.dart';
import 'package:maramstore/products%20information/ProductDetails.dart';
import 'package:maramstore/products%20information/Products_Information.dart';
import 'package:provider/provider.dart';

class Icecream extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IcecreamState();
}
      
class _IcecreamState extends State<Icecream> {
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
        ],
        iconTheme: const IconThemeData(color: Colors.white),
        shadowColor: const Color.fromARGB(255, 96, 5, 35),
        elevation: 2.0,
        backgroundColor: Colors.pink,
        title: const Text(
          "Ice Cream",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.pinkAccent,
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.75,
          ),
          itemCount: IceCream.length,
          itemBuilder: (context, i) {
            final Category = IceCream[i];

            return GestureDetector(
              onTap: () {
                // Navigate to ProductDetails
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(
                      name: Category.name ?? "No Name",
                      picture:
                          Category.image ?? 'assets/images/placeholder.jpg',
                      price: Category.price ?? "No Price",
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.asset(
                        Category.image ?? 'assets/images/placeholder.jpg',
                        width: double.infinity,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              Category.name ?? "No Name",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.pinkAccent,
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "${Category.price}",
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          onPressed: () {
                            final favouriteProvider =
                                Provider.of<FavouriteProvider>(context,
                                    listen: false);
                            setState(() {
                              Category.icon = Category.icon == Icons.favorite
                                  ? Icons.favorite_border
                                  : Icons.favorite;
                            });

                            if (Category.icon == Icons.favorite) {
                              final favouriteItem = {
                                'name': Category.name ?? "No Name",
                                'image': Category.image ??
                                    'assets/images/placeholder.jpg',
                                'price': Category.price ?? "No Price",
                                'icon': Category.icon
                              };

                              if (mounted) {
                                favouriteProvider
                                    .addToFavourites(favouriteItem);
                              }
                            }
                               else { // delete the favourite from favourite
                                if (mounted) {
                            favouriteProvider.removeByName(Category.name ?? "");
                              }
                              }
                          },
                          icon: Icon(
                            Category.icon,
                            color: Colors.red,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
