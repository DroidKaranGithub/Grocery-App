import 'package:flutter/material.dart';
import 'package:grocery_app/Category/category_list_screen.dart';
import 'package:grocery_app/ProductListScreen/product_list_screen.dart';
import 'package:grocery_app/home/home_screen.dart';
import 'package:grocery_app/home/splash_screen.dart';
import 'package:grocery_app/login/login.dart';
import 'package:grocery_app/signup/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        "splashscreen": (context) => SplashScreen(),
        'login': (context) => Login(),
        'signup': (context) => SignUp(),
        'homepage': (context) => HomePage(),
        "categoryscreen": (context) => CategoryScreen(),
        "productlistscreen": (context) => ProductListScreen()
      },
      home: SplashScreen(),
    );
  }
}
