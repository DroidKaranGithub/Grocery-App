import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grocery_app/network/apiconstant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences sharedPreferences;
  late bool _isLogin;
  @override
  void initState() {
    getValidation().whenComplete(() async {
      Timer(
        Duration(seconds: 1),
        () => Navigator.of(context)
            .popAndPushNamed(_isLogin ? 'homepage' : 'login'),
      );
    });

    super.initState();
  }

  Future getValidation() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _isLogin = sharedPreferences.getBool(PREF_LOGIN) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
    );
  }
}
