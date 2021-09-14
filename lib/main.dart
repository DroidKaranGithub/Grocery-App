import 'package:flutter/material.dart';
import 'package:grocery_app/ProductList/product_list_screen.dart';
import 'package:grocery_app/home/home_screen.dart';
import 'package:grocery_app/login/login.dart';
import 'package:grocery_app/signup/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        'login': (context) => Login(),
        'signup': (context) => SignUp(),
        'homepage': (context) => HomePage(),
        "productlist": (context) => ProductScreen()
      },
      home: HomePage(),
    );
  }
}
