import 'package:flutter/material.dart';
import 'package:grocery_app/models/models/category_product_list.dart';

class ProductList extends StatelessWidget {
  final List<CategoryList> categories;

  ProductList({required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        padding: EdgeInsets.only(left: 12.0, right: 12.0),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (ctx, index) {
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
                    child: Container(
                      margin:
                          EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          categories[index].image_url.toString(),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 16.0),
                    child: Text(
                      categories[index].name.toString(),
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
        },
        itemCount: categories.length,
      ),
    );
  }
}
