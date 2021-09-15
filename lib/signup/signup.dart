import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_app/models/models/sign_up_response_bean.dart';
import 'package:grocery_app/network/apiconstant.dart';

import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isNameEmpty = false;
  bool isEmaileEmpty = false;
  bool isPasswordEmpty = false;
  bool isConfirmPasswordEmpty = false;
  bool _isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void isValid(BuildContext context) {
    setState(() {
      print('Signup button clicked');
      if (nameController.text.isEmpty) {
        print('Name not valid');
        isNameEmpty = true;
      } else if (emailController.text.isEmpty) {
        print('Email not valid');
        isNameEmpty = false;
        isEmaileEmpty = true;
      } else if (passwordController.text.isEmpty) {
        print('Password Empty');
        isNameEmpty = false;
        isEmaileEmpty = false;
        isPasswordEmpty = true;
      } else if (passwordController.text.toString().length < 6) {
        print('Password not 6 digit long');
        isNameEmpty = false;
        isEmaileEmpty = false;
        isPasswordEmpty = true;
      } else if (confirmPasswordController.text.toString() !=
          passwordController.text.toString()) {
        print('Confirm password does not match with password');
        isNameEmpty = false;
        isEmaileEmpty = false;
        isPasswordEmpty = false;
        isConfirmPasswordEmpty = true;
      } else {
        _isLoading = true;
        signIn(nameController.text, emailController.text,
            passwordController.text, confirmPasswordController.text, context);
      }
    });
  }

  signIn(String name, String email, String password, String confirmPassword,
      BuildContext context) async {
    print(
        "Name -> $name \n Email -> $email \n Password -> $password \n ConfirmPassword -> $confirmPassword");

    Map data = <String, String>{
      'name': name,
      'email': email,
      'password': password,
      'c_password': confirmPassword,
    };
    print(data);
    print(SIGNUP);
    var signUpresponse = await http.post(
      Uri.parse(SIGNUP),
      body: data,
    );

    print(signUpresponse.statusCode);

    print('Map_Response_Data->  ${signUpresponse.statusCode}');
    Map resData = json.decode(signUpresponse.body);
    print('Map_Response_Data->  $resData');
    // SignUpResponse response = SignUpResponse();
    SignUpResponseBean signUpResponseBean =
        SignUpResponseBean.fromJson(resData);
    // _showToast(context, signUpResponseBean);1
    print("SignUp success 200");
    print(signUpResponseBean.message);
    if (signUpresponse.statusCode == 200) {
      print("SignUp success");
      if (signUpResponseBean.success == true) {
        setState(() {
          _isLoading = false;
          Navigator.of(context).pushReplacementNamed("homepage");
        });
      } else if (signUpResponseBean.success == false) {
        setState(() {
          _isLoading = false;
        });
        this._showToast(context, signUpResponseBean);
        print(signUpResponseBean);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      this._showToast(context, signUpResponseBean);
    }
  }

  void _showToast(BuildContext context, SignUpResponseBean response) {
    ScaffoldMessenger(
      key: _scaffoldKey,
      child: Text(
        response.message.toString(),
      ),
    );
    // _scaffoldKey.currentState.
    // // _scaffoldKey.currentState!.showSnackBar(
    // //   new SnackBar(
    // //     content: Text(
    // //       response.message.toString(),
    // //     ),
    // //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.green[100],
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SignUp',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.green,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 16, left: 16),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      errorText: isNameEmpty ? 'Please enter name' : null,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 12.0),
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Enter full name',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.normal,
                      ),
                      // labelText: 'Full name',
                      labelStyle: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.normal,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 16, left: 16),
                  child: TextFormField(
                    autofocus: false,
                    controller: emailController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      errorText: isEmaileEmpty ? 'Please enter email' : null,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 12.0),
                      hintText: 'Enter email number',
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
                    top: 10,
                    right: 16,
                    left: 16,
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      errorText:
                          isPasswordEmpty ? 'Please enter password' : null,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 12.0),
                      hintText: 'Enter password',
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
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    right: 16,
                    left: 16,
                  ),
                  child: TextFormField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      errorText: isConfirmPasswordEmpty
                          ? 'Please enter confirm password'
                          : null,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 12.0),
                      hintText: 'Enter confirm password',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.normal,
                      ),
                      // labelText: 'Confirm Password',
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
                    onPressed: () => isValid(context),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      child: Text(
                        'SignUp',
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
                        "Already have an account!",
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.only(right: 0, left: 0),
                          ),
                        ),
                        child: Text(
                          'Login',
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
                )
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
