import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_app/models/models/category_product_list.dart';
import 'package:grocery_app/network/apiconstant.dart';
import 'package:http/http.dart' as http;

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
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
          "Product List",
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
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
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
                  if (categoriesData.isNotEmpty) list()
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
      ),
    );
  }

  Widget list() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shrinkWrap: true,
      physics: ScrollPhysics(),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: ((ctx, index) {
        return Container(
          child: Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed("productlistscreen"),
                    child: Container(
                      margin:
                          EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          categoriesData[index].imageUrl.toString(),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 16.0),
                  child: Text(
                    categoriesData[index].name.toString(),
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      itemCount: categoriesData.length,
    );
  }
}
