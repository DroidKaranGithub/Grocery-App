import 'package:flutter/material.dart';
import 'package:grocery_app/main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: TextFormField(
              autofocus: false,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                hintText: 'Enter mobile number',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.normal,
                ),
                labelText: 'Mobile',
                labelStyle: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.normal,
                ),
                prefixIcon: Icon(Icons.phone_android_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 16,
              left: 16,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                hintText: 'Enter password',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.normal,
                ),
                labelText: 'Password',
                labelStyle: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.normal,
                ),
                prefixIcon: Icon(Icons.password_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(
              right: 16,
              left: 16,
            ),
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(_createRoute());
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
    // transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //   return child;
    // },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
