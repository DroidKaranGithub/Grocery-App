import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_app/home/fruite_list.dart';
import 'package:grocery_app/home/home_top_header.dart';
import 'package:grocery_app/home/vegetable_list.dart';
import 'package:grocery_app/models/models/test_list.dart';
import 'package:grocery_app/network/apiconstant.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Data> data = [];
  TestList testList = TestList();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _loadList();
  }

  void _loadList() async {
    var response = await http.get(Uri.parse(PRODUCT_LIST));

    var listResponse = json.decode(response.body);
    testList = new TestList.fromJson(listResponse);
    if (response.statusCode == 200) {
      if (testList.success == true) {
        setState(() {
          data = testList.data!;
          _isLoading = false;
        });
      } else {
        _isLoading = false;
      }
    } else {
      _isLoading = false;
    }

    print("Response -> ${testList.data![0].image_url.toString()}");
    // print("Response -> ${data.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          SingleChildScrollView(
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
                      margin: EdgeInsets.only(top: 16, right: 6),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("productlist");
                        },
                        child: Text(
                          'View all',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.normal,
                            color: Colors.orange[800],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (data.isNotEmpty) VegetableWidget(data: testList.data!),
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
                if (data.isNotEmpty) VegetableWidget(data: testList.data!),
              ],
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.grey.withOpacity(0.2),
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.greenAccent,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
