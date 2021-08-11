import 'package:flutter/material.dart';
import 'package:grocery_app/home/frute_list.dart';
import 'package:grocery_app/home/vegetable_list.dart';
import './home/home_top_header.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HomeTopHeader(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 16, left: 16),
                  child: Text(
                    'Category name',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16, right: 16),
                  child: Text(
                    'View all',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.normal,
                      color: Colors.orange[800],
                    ),
                  ),
                )
              ],
            ),
            VegetableWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 16, left: 16),
                  child: Text(
                    'Category name',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16, right: 16),
                  child: Text(
                    'View all',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.normal,
                      color: Colors.orange[800],
                    ),
                  ),
                )
              ],
            ),
            FruiteWidget(),
          ],
        ),
      ),
    );
  }
}
