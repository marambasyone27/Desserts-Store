import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Row(
            children: [
              IconButton(onPressed:() {
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back, color: Colors.white,),),
              SizedBox(width: 5,),
          const Text(
            "🍭About My Store🍭",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: 'Caveat',
              fontStyle: FontStyle.italic,
              shadows: [
                Shadow(
                  color: Color.fromARGB(236, 223, 7, 14),
                  offset: Offset(2, 2),
                  blurRadius: 3,
                ),
              ],
            ),
          ),
            ],
          ),
          centerTitle: true,
          //backgroundColor: Colors.pink, // تغيير لون الـ AppBar إذا رغبتِ
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10), // مسافة بين العنوان والصورة
              ClipOval(
               
                child: Image.asset(
                  "assets/images/strawberryCake.jpg",
                 // width: 300, // تحديد عرض الصورة
                  height: 300, // تحديد ارتفاع الصورة
                  fit: BoxFit.cover, // جعل الصورة تملأ الإطار بشكل جيد
                ),
              ),
              const SizedBox(height: 3), // مسافة بعد الصورة
              const Padding(
                padding: EdgeInsets.all(7.0),
                child: Text(
                  "Welcome to Maram's Sweet Haven store🍰🍨 We are a specialty store offering the finest chocolates🍫\n delicious ice creams🍦, a variety of sweets🍩, and refreshing juices🥤. \n Our journey started with the aim of providing the highest quality products that satisfy all tastes🥰",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Caveat',
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                  ),
                  
                ),
              ),
              const SizedBox(height: 7),
             const  Align(
              
                alignment: Alignment.centerLeft, // مسافة بين النص والصورة
             child:Text("Our Vision:" , style: TextStyle( color: Colors.white,
             
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'Caveat',
              fontStyle: FontStyle.italic,
              shadows: [
                Shadow(
                  color: Color.fromARGB(198, 238, 18, 25),
                  offset: Offset(2, 2),
                  blurRadius: 3,
                ),
              ],),
              ),
             ),
             const Padding(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  "To deliver high-quality products.\nTo offer a unique shopping experience for our customers.\nTo use natural and healthy ingredients in all our products.\nOur Story: Founded in 2020, our mission has always been to create a space where people \n can indulge in the finest treats while enjoying a premium experience. Whether you’re \n craving chocolate, ice cream, or a refreshing juice, we’ve got something for everyone.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Caveat',
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                  ),
                  
                ),
              ),
              const SizedBox(height: 7),
              const  Align(
              
                alignment: Alignment.centerLeft, // مسافة بين النص والصورة
             child:Text("Our Values:" , style: TextStyle( color: Colors.white,
             
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'Caveat',
              fontStyle: FontStyle.italic,
              shadows: [
                Shadow(
                  color: Color.fromARGB(198, 238, 18, 25),
                  offset: Offset(2, 2),
                  blurRadius: 3,
                ),
              ],),
              ),
             ),
             const Padding(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  "Quality: We are committed to offering the best quality in every product we serve.\nInnovation: We constantly look for new ways to bring exciting and delicious options to\n our menu.\nCustomer Satisfaction: Your happiness is our top priority, and we always strive to exceed\n your expectations.\nWe believe that food is not just a product, but an experience that should be enjoyed by everyone."
                  ,textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Caveat',
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                  ),
                  
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  
                  "Thank you for choosing us🫶🏻, and we hope you enjoy our products🥰 as much as we enjoy making them for you✨"
                  ,textAlign: TextAlign.center,
                  style: TextStyle(
                    //backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    //fontFamily: 'Caveat',
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                  ),
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
