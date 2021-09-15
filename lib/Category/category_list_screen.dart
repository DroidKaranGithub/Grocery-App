import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_app/Category/product_list.dart';
import 'package:grocery_app/models/models/category_product_list.dart';
import 'package:grocery_app/network/apiconstant.dart';
import 'package:http/http.dart' as http;

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Categories categories = Categories();
  List<CategoryList> categoriesData = [];
  List<CategoryList> categoriesName = [];

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _loadData();
  }

  void _loadData() async {
    var apiResponse = await http.get(Uri.parse(CATEGORIES));

    var listResponse = json.decode(apiResponse.body);
    categories = Categories.fromJson(listResponse);
    if (apiResponse.statusCode == 200) {
      if (categories.success == true) {
        setState(() {
          _isLoading = false;
          categoriesData = categories.data!;
          categoriesName = categories.data!;
        });
      } else {
        _isLoading = false;
      }
    } else {
      _isLoading = false;
    }

    print("Response -> ${categories.data![0].imageUrl.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1.0,
        backgroundColor: Colors.grey.shade100,
        title: Text(
          "Category Name",
          style: TextStyle(color: Colors.black, fontSize: 16.0),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (categoriesData.isNotEmpty) catergoryList(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                    child: TextField(
                      onChanged: (value) {
                        //Do something with the user input.
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.search_outlined),
                        hintText: 'Search product.',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 6.0, left: 16.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Category name',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () {},
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  if (categoriesData.isNotEmpty)
                    ProductList(
                      categories: categoriesData,
                    ),
                ],
              ),
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

  Widget catergoryList() => Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        height: 60,
        child: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          padding: EdgeInsets.only(left: 16.0, top: 10.0, bottom: 10.0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return Container(
              margin: EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5.0,
                  )
                ],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20.0),
                child: Center(
                  child: Text(
                    categoriesData[index].name.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            );
          },
          itemCount: categoriesData.length,
        ),
      );
}
