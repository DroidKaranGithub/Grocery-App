import 'package:flutter/material.dart';
import 'package:grocery_app/models/models/test_list.dart';

class FruiteWidget extends StatelessWidget {
  final List<Data> data;
  FruiteWidget({required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return Container(
            width: 150,
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
                          EdgeInsets.only(top: 15.0, left: 16.0, right: 16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          data[index].imageUrl.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 16.0),
                    child: Text(
                      data[index].name.toString(),
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
        itemCount: data.length,
      ),
    );
  }
}
