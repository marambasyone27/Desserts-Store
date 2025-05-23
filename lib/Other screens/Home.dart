import 'package:flutter/material.dart';
import 'package:maramstore/FavouriteProvider.dart';
import 'package:maramstore/Other%20screens/About_US.dart';
import 'package:maramstore/Other%20screens/Cart.dart';
import 'package:maramstore/Other%20screens/Contact_US.dart';
import 'package:maramstore/Other%20screens/Favourite.dart';
import 'package:maramstore/Other%20screens/Login.dart';
import 'package:maramstore/Other%20screens/ProfilePage.dart';
import 'package:maramstore/Shared.dart';
import 'package:maramstore/ThemeProvider.dart';
import 'package:maramstore/categories/Cake.dart';
import 'package:maramstore/categories/IceCream.dart';
import 'package:maramstore/categories/Sweets.dart';
import 'package:maramstore/categories/juice.dart';
import 'package:maramstore/enum.dart';
import 'package:maramstore/products%20information/ProductDetails.dart';
import 'package:maramstore/products%20information/Products_Information.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Variables to store name and email
  Future<Map<String, String>> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString('name') ?? 'User',
      'email': prefs.getString('email') ?? 'No Email',
    };
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 21,
        selectedItemColor: Colors.pinkAccent,
        selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
        selectedIconTheme: const IconThemeData(color: Colors.pinkAccent),
        unselectedFontSize: 20,
        unselectedItemColor: Colors.pinkAccent,
        unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic),
        unselectedIconTheme: const IconThemeData(color: Colors.pinkAccent),
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Home()));
                  },
                  icon: const Icon(Icons.home_outlined)),
              label: "Home"),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Favourite(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.favorite_border_outlined)),
              label: "Favorite"),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  icon: const Icon(Icons.person)),
              label: "Profile"),
        ],
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.pink,
        title: const Text(
          "Welcome to Maram's Sweet Haven",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Caveat",
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              color: Colors.white,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Cart()));
            },
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Search...",
                        prefixIcon: Icon(Icons.search, color: Colors.pink),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink, width: 2),
                        ),
                        contentPadding: EdgeInsets.all(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: FutureBuilder<Map<String, String>>(
          future: _getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Error loading user data'));
            }
            final userData = snapshot.data ?? {'name': 'User', 'email': 'No Email'};
            return ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('Hello ' + userData['name']! + ' to  Maram Sweet Haven'),
                  accountEmail: Text(userData['email']!),
                  currentAccountPicture: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/cat8.jpg"),
                  ),
                  decoration: const BoxDecoration(color: Colors.pink),
                ),
                _buildDrawerItem(Icons.home, "Home", Colors.pinkAccent, () {
                  Navigator.pop(context);
                }),
                _buildDrawerItem(Icons.info, "About us", Colors.pink, () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => AboutUs()));
                }),
                _buildDrawerItem(Icons.contact_page, "Contact us", Colors.blue, () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => ContactUs()));
                }),
                _buildDrawerItem(Icons.shopping_cart, "Cart", Colors.green, () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Cart()));
                }),
                _buildDrawerItem(Icons.logout, "Sign out", Colors.orange, () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Sign out"),
                        content: const Text("Are you sure you want to sign out?"),
                        actions: [
                          TextButton(
                            child: const Text("Cancel"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: const Text("Sign out"),
                            onPressed: () {
                              Shared.putBoolean(key: SharedKeys.isLogin, value: false);
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => Login()));
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
              ],
            );
          },
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Categories",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        icon: const Icon(Icons.dashboard_outlined,
                            color: Colors.white),
                      ),
                    ),
                    const Text("All",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Cake()));
                        },
                        icon:
                            const Icon(Icons.cake_rounded, color: Colors.white),
                      ),
                    ),
                    const Text("Cakes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Icecream()));
                        },
                        icon: const Icon(Icons.icecream, color: Colors.white),
                      ),
                    ),
                    const Text("Ice Cream",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Sweets()));
                        },
                        icon: const Icon(Icons.cookie_outlined,
                            color: Colors.white),
                      ),
                    ),
                    const Text("Sweets",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Juice()));
                        },
                        icon: const Icon(Icons.local_drink_sharp,
                            color: Colors.white),
                      ),
                    ),
                    const Text("Juices",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.75,
              ),
              itemCount: AllCategories.isNotEmpty ? AllCategories.length : 0,
              itemBuilder: (context, i) {
                final Category = AllCategories[i];
                return GestureDetector(
                  onTap: () {
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
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 30),
                            Text(
                              "${Category.price}",
                              style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.pinkAccent,
                              ),
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              onPressed: () {
                                final favouriteProvider =
                                    Provider.of<FavouriteProvider>(context,
                                        listen: false);
                                setState(() {
                                  Category.icon =
                                      Category.icon == Icons.favorite
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
                                } else {
                                  if (mounted) {
                                    favouriteProvider
                                        .removeByName(Category.name ?? "");
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
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      IconData icon, String title, Color iconColor, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title),
      onTap: onTap,
    );
  }
}