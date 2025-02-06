import 'package:flutter/material.dart';

class Products_Information {
  String ?name;
  String ?price;
  String ?image;
  IconData ?icon;
   Products_Information(this.name, this.price, this.image, this.icon);
}

List<Products_Information> AllCategories = [
  Products_Information("strawberry Cake", "250EGP", "assets/images/strawberryCake2.jpg", Icons.favorite_border_outlined),
  Products_Information( "Sprite soda", "80EGP",  "assets/images/Sprite soda.jpg",Icons.favorite_border_outlined),
  Products_Information( "Muffin",  "200EGP", "assets/images/Muffin.jpg", Icons.favorite_border_outlined),
  Products_Information("Strawberry Ice Cream","100EGP",  "assets/images/strawberry.jpg", Icons.favorite_border_outlined),
  Products_Information("Chocolate Overload Cake", "240EGP", "assets/images/ChocolateOverloadCake.jpg", Icons.favorite_border_outlined),
  Products_Information( "Fresh Lemon Juice", "80EGP",  "assets/images/freshLemonJuice.jpg",Icons.favorite_border_outlined),
  Products_Information( "Cinnabon",  "200EGP", "assets/images/Cinnabon.jpg", Icons.favorite_border_outlined),
  Products_Information("caramel& Ice Cream","110EGP",  "assets/images/caramel&chooclate.jpg",  Icons.favorite_border_outlined),
  Products_Information("strawberrey CheeseCake","200EGP","assets/images/strawberreyCheeseCake.jpg", Icons.favorite_border_outlined),
  Products_Information("Fresh Mango Juice",  "70EGP", "assets/images/mangoJuice.jpg", Icons.favorite_border_outlined),
  Products_Information( "Qatayef", "120EGP", "assets/images/Qatayef.jpg", Icons.favorite_border_outlined),
  Products_Information("Orea Ice Cream",  "70EGP", "assets/images/orea.jpg", Icons.favorite_border_outlined),
  Products_Information( "Banana CheeseCake", "300EGP", "assets/images/bananaCheeseCake.jpg", Icons.favorite_border_outlined),
  Products_Information("Blue Berry Milkshake", "100EGP", "assets/images/Berry Milkshake.jpg", Icons.favorite_border_outlined),
  Products_Information( "Donuts", "130EGP", "assets/images/Donuts.jpg", Icons.favorite_border_outlined),
  Products_Information("lotus Ice Cream",  "50EGP", "assets/images/lotus.jpg", Icons.favorite_border_outlined),
];
List<Products_Information> Cakes = [
    Products_Information("strawberry Cake", "220EGP", "assets/images/strawberryCake.jpg", Icons.favorite_border_outlined),
  Products_Information("strawberrey CheeseCake","200EGP","assets/images/strawberreyCheeseCake.jpg", Icons.favorite_border_outlined),
  Products_Information("Chocolate Overload Cake", "240EGP", "assets/images/ChocolateOverloadCake.jpg", Icons.favorite_border_outlined),
  Products_Information("strawberry Cake", "250EGP", "assets/images/strawberryCake2.jpg", Icons.favorite_border_outlined),
Products_Information("Blueberry Cake", "250EGP", "assets/images/blueberryCake.jpg", Icons.favorite_border_outlined),
Products_Information("chooclate Cake", "290EGP", "assets/images/chooclateCake.jpg", Icons.favorite_border_outlined),
  Products_Information( "Banana CheeseCake", "300EGP", "assets/images/bananaCheeseCake.jpg", Icons.favorite_border_outlined),
Products_Information("caramel Cake", "300EGP", "assets/images/caramelCake.jpg", Icons.favorite_border_outlined),
Products_Information("lemon Cake", "200EGP", "assets/images/lemonCake.jpg", Icons.favorite_border_outlined),
Products_Information("Lotus Cake", "270EGP", "assets/images/lotusCake2.jpg", Icons.favorite_border_outlined),
  Products_Information("orange Cake", "240EGP", "assets/images/orangeCake2.jpg", Icons.favorite_border_outlined ),
  Products_Information("Orea Cake", "230EGP", "assets/images/oreaCake.jpg", Icons.favorite_border_outlined),
  Products_Information("vanilla Cake", "200EGP", "assets/images/vanillaCake.jpg", Icons.favorite_border_outlined),
  Products_Information("Lotus Cake", "270EGP", "assets/images/lotusCake.jpg", Icons.favorite_border_outlined),
];
List<Products_Information> Juices = [
  Products_Information( "Fresh Lemon Juice", "80EGP",  "assets/images/freshLemonJuice.jpg",Icons.favorite_border_outlined),
  Products_Information( "Fresh Mango Juice",  "70EGP", "assets/images/mangoJuice.jpg", Icons.favorite_border_outlined),
  Products_Information( "Sprite soda", "80EGP",  "assets/images/Sprite soda.jpg",Icons.favorite_border_outlined),
  Products_Information( "Coca-Cola",  "80EGP", "assets/images/coca-cola.jpg", Icons.favorite_border_outlined),
  Products_Information("lotus MilkShake", "140EGP", "assets/images/lotusMilkShake.jpg",Icons.favorite_border_outlined),
   Products_Information("strawberry MilkShake", "150EGP", "assets/images/strawberryMilkShake.jpg", Icons.favorite_border_outlined),
  Products_Information("Vanilla Milkshake", "130EGP", "assets/images/VanillaMilkshake.jpg", Icons.favorite_border_outlined),
  Products_Information("strawberry Juice", "130EGP", "assets/images/strawberryJuice.jpg", Icons.favorite_border_outlined),
  Products_Information("Caramel Milkshake", "90EGP", "assets/images/Caramel Milkshake.jpg", Icons.favorite_border_outlined),
  Products_Information("strawberry MilkShake", "160EGP", "assets/images/strawberryMilkShake2.jpg", Icons.favorite_border_outlined),
  Products_Information("strawberry Juice", "130EGP", "assets/images/strawberryJuice2.jpg", Icons.favorite_border_outlined),
  Products_Information("peach Juice", "140EGP", "assets/images/peachJuice.jpg",  Icons.favorite_border_outlined),
  Products_Information("Orange Juice", "80EGP", "assets/images/orangeJuice.jpg", Icons.favorite_border_outlined),
  Products_Information("Kiwi Juice", "70EGP", "assets/images/KiwiJuice.jpg",  Icons.favorite_border_outlined),
  Products_Information("Iced Mocha", "60EGP", "assets/images/Iced Mocha.jpg", Icons.favorite_border_outlined),
  Products_Information("Iced Caramel Coffee", "70EGP", "assets/images/Iced Caramel Coffee.jpg", Icons.favorite_border_outlined),
  Products_Information("Fruit Soda", "80EGP", "assets/images/Fruit Soda.jpg", Icons.favorite_border_outlined),
  Products_Information("Cookie Milkshake", "110EGP", "assets/images/Cookie Milkshake.jpg", Icons.favorite_border_outlined),

]; 
List<Products_Information> Sweats = [
  Products_Information("Cinnabon", "180EGP", "assets/images/Cinnabon.jpg", Icons.favorite_border_outlined),
  Products_Information("Muffin", "160EGP", "assets/images/Muffin.jpg", Icons.favorite_border_outlined),
  Products_Information("Nutella Bomboloni", "170EGP", "assets/images/Nutella Bomboloni.jpg", Icons.favorite_border_outlined),
  Products_Information("Qatayef", "160EGP", "assets/images/Qatayef.jpg", Icons.favorite_border_outlined),
  Products_Information("Petit four", "150EGP", "assets/images/Petit four.jpg", Icons.favorite_border_outlined),
  Products_Information("Ghraybeh", "150EGP", "assets/images/Ghraybeh.jpg", Icons.favorite_border_outlined),
  Products_Information("Dounts", "170EGP", "assets/images/Donuts.jpg", Icons.favorite_border_outlined),
  Products_Information("Pancake", "140EGP", "assets/images/Pancake.jpg", Icons.favorite_border_outlined),
   Products_Information("Kunafa with pistachio", "150EGP", "assets/images/Kunafa with pistachio.jpg", Icons.favorite_border_outlined),
    Products_Information("Jalash", "130EGP", "assets/images/Jalash.jpg", Icons.favorite_border_outlined),
    Products_Information("Cookies", "110EGP", "assets/images/cookies.jpg", Icons.favorite_border_outlined),
     Products_Information("Coco Roll", "120EGP", "assets/images/Coco Roll.jpg", Icons.favorite_border_outlined),
      Products_Information("Chooclates", "160EGP", "assets/images/Chooclates.jpg", Icons.favorite_border_outlined),
      Products_Information("Chocolate Mousse", "170EGP", "assets/images/Chocolate Mousse.jpg", Icons.favorite_border_outlined),
Products_Information("Basbousa", "160EGP", "assets/images/Basbousa.jpg", Icons.favorite_border_outlined),
Products_Information("Baklava", "130EGP", "assets/images/Baklava.jpg", Icons.favorite_border_outlined),
Products_Information("Balah El Sham", "140EGP", "assets/images/Balah El Sham.jpg", Icons.favorite_border_outlined),
  Products_Information("Qatayef", "160EGP", "assets/images/Qatayef.jpg", Icons.favorite_border_outlined),


];
List<Products_Information> IceCream = [
  Products_Information("strawberry Ice Cream", "50EGP", "assets/images/strawberry2.jpg",  Icons.favorite_border_outlined),
  Products_Information("strawberry Ice Cream", "55EGP", "assets/images/strawberry.jpg",  Icons.favorite_border_outlined),
  Products_Information("Cream Ice", "60EGP", "assets/images/cream.jpg", Icons.favorite_border_outlined),
  Products_Information("vanilla Ice Cream", "35EGP", "assets/images/vanilla.jpg",  Icons.favorite_border_outlined),
  Products_Information("Lotus Ice Cream", "90EGP", "assets/images/lotus.jpg", Icons.favorite_border_outlined),
    Products_Information("Orea Ice Cream", "50EGP", "assets/images/orea.jpg", Icons.favorite_border_outlined),
  Products_Information("watermelon Ice Cream", "40EGP", "assets/images/watermelon.jpg", Icons.favorite_border_outlined),
  Products_Information("red berries Ice Cream", "45EGP", "assets/images/redberries.jpg", Icons.favorite_border_outlined),
  Products_Information("Blueberry Ice Cream", "45EGP", "assets/images/blueberry.jpg", Icons.favorite_border_outlined),
  Products_Information("Mango Ice Cream", "45EGP", "assets/images/mango.jpg", Icons.favorite_border_outlined),
   Products_Information("Lemon Ice Cream", "48EGP", "assets/images/lemon.jpg", Icons.favorite_border_outlined),
   Products_Information("Fruit Ice Cream", "60EGP", "assets/images/fruit icecream.jpg", Icons.favorite_border_outlined),
   Products_Information("chooclate Ice Cream", "30EGP", "assets/images/chooclate.jpg", Icons.favorite_border_outlined),
    Products_Information("caramel Ice Cream", "30EGP", "assets/images/caramel&chooclate.jpg", Icons.favorite_border_outlined),
Products_Information("caramel Ice Cream", "40EGP", "assets/images/caramel.jpg", Icons.favorite_border_outlined),
  Products_Information("strawberry Ice Cream", "55EGP", "assets/images/strawberry.jpg",  Icons.favorite_border_outlined),



];