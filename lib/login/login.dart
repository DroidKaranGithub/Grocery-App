import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/models/login_response.dart';
import 'package:grocery_app/network/apiconstant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late SharedPreferences sharedPreferences;
  bool isEmaileEmpty = false;
  bool isPasswordEmpty = false;
  bool _isLoading = false;
  LoginResponse response = LoginResponse();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _isValid() {
    setState(() {
      if (emailController.text.isEmpty) {
        isEmaileEmpty = true;
      } else if (passwordController.text.isEmpty) {
        print('Password Empty');
        isEmaileEmpty = false;
        isPasswordEmpty = true;
      } else {
        isEmaileEmpty = false;
        isPasswordEmpty = false;
        _isLoading = true;
        _login(emailController.text, passwordController.text);
      }
    });
  }

  _login(String email, String password) async {
    print("Email -> $email \n Password -> $password");
    Map data = <String, String>{"email": email, "password": password};

    print("Map data -> $data");
    var loginResponse = await http.post(Uri.parse(LOGIN), body: data);

    print("Login Response-> $loginResponse");
    print('Map_Response_Data->  ${loginResponse.statusCode}');
    Map loginData = json.decode(loginResponse.body);

    response = LoginResponse.fromJson(loginData);

    if (loginResponse.statusCode == 200) {
      if (response.success == true) {
        setState(() {
          _isLoading = false;
          savePref().whenComplete(() async {
            Navigator.of(context).pushReplacementNamed("homepage");
          });
        });
      } else if (response.success == false) {
        setState(() {
          _isLoading = false;
        });
        this._showToast(context, response);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      this._showToast(context, response);
    }
  }

  void _showToast(BuildContext context, LoginResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          response.message.toString(),
        ),
      ),
    );
    // ScaffoldMessenger(
    //   key: _scaffoldKey,
    //   child: Text(
    //     response.message.toString(),
    //   ),
    // );
    // _scaffoldKey.currentState!.showSnackBar(
    //   new SnackBar(
    //     content: Text(
    //       response.message.toString(),
    //     ),
    //   ),
    // );
  }

  Future savePref() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(PREF_LOGIN, true);
    sharedPreferences.setString(PREF_NAME, response.data!.name.toString());
    sharedPreferences.setString(PREF_EMAIL, response.data!.email.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.green[100],
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: TextFormField(
                  autofocus: false,
                  controller: emailController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                    errorText: isEmaileEmpty ? 'Please enter email' : null,
                    hintText: 'Enter Email number',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.normal,
                    ),
                    // labelText: 'Email',
                    labelStyle: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.normal,
                    ),
                    prefixIcon: Icon(Icons.email_outlined),
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
                  controller: passwordController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                    hintText: 'Enter password',
                    errorText: isPasswordEmpty ? 'Please enter password' : null,
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.normal,
                    ),
                    // labelText: 'Password',
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
                    FocusScope.of(context).unfocus();
                    _isValid();
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
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('signup');
                      },
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
