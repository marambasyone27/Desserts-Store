import 'package:flutter/material.dart';
import 'package:maramstore/FavouriteProvider.dart';
import 'package:provider/provider.dart';

class Favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
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
            child: Image.asset(
              'assets/images/login2.jpg',
              fit: BoxFit.cover,
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
                          trailing: IconButton(
                            icon: const Icon(Icons.delete
                            , color: Colors.red),
                            onPressed: () {
                              favouriteProvider.removeFromFavourites(index);
                              
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