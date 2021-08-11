import 'package:flutter/material.dart';

class VegetableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16),
      height: 250,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            childAspectRatio: 1.5,
            mainAxisExtent: 160,
            mainAxisSpacing: 3),
        itemCount: 10,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Card(
              elevation: 6,
              // shadowColor: Color(0xf0000001A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/images/veg.jpeg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    "Name",
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      // child: ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   itemBuilder: (ctx, index) {
      //     return Card(
      //       child: Column(
      //         children: [
      //           Container(
      //             margin: EdgeInsets.only(left: 16, right: 16),
      //             width: MediaQuery.of(context).size.width * 0.42,
      //             child: Image.asset(
      //               'assets/images/veg.jpeg',
      //               fit: BoxFit.contain,
      //             ),
      //           ),
      //           Text(
      //             "Name",
      //             style: TextStyle(
      //               fontFamily: 'OpenSans',
      //               fontSize: 16,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           )
      //         ],
      //       ),
      //     );
      //   },
      //   itemCount: 10,
      // ),
    );
  }
}
