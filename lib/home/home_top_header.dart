import 'package:flutter/material.dart';

class HomeTopHeader extends StatelessWidget {
  const HomeTopHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.3,
          child: Image.asset(
            'assets/images/grocery_bg.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          // padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 16, right: 16),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              )),
        ),
        Positioned(
          bottom: 10,
          right: 16,
          left: 16,
          child: Container(
            child: TextField(
              style: TextStyle(fontFamily: 'OpenSans'),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search giants grocery stores',
                  hintStyle: TextStyle(fontFamily: 'OpenSans'),
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
