// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raya/screens/layout/appBar.dart';
import 'package:raya/screens/layout/basebottombar.dart';
import 'package:raya/screens/layout/colors.dart';
import 'package:raya/main.dart';
import 'package:raya/models/UserModel.dart';
import 'package:raya/providers/userProvider.dart';

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:raya/screens/user/changePassword.dart';
import 'package:raya/screens/user/signup.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image(
                image: AssetImage('images/Sign-In-Icon.png'),
                width: 100.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Sign in'.toUpperCase(),
                style: TextStyle(color: kPrimaryColor, fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              padding: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/BG.png'), fit: BoxFit.cover, alignment: Alignment.bottomCenter),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          maxLines: 1,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                                width: 1,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: kPrimaryColor,
                              size: 30,
                            ),
                          ),
                          style: TextStyle(
                            color: kBorderColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a Password';
                            } else if (value.length < 6) {
                              return 'Make sure its more than 6 characters';
                            }
                            return null;
                          },
                          maxLines: 1,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: kBorderColor,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kBorderColor,
                                width: 1,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: kPrimaryColor,
                              size: 30,
                            ),
                          ),
                          style: TextStyle(
                            color: kBorderColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: kPrimaryColor,
                            minimumSize: Size(double.infinity, 50),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              login(_emailController.text.toString(), _passwordController.text.toString());
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => ChangePassword()),
                    //     );
                    //   },
                    //   child: Text(
                    //     'Forget Password?',
                    //     style: TextStyle(
                    //       color: kPrimaryColor,
                    //       fontSize: 16,
                    //       decoration: TextDecoration.underline,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        'Don\'t have an account? Sign up',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BaseBottomBar(),
    );
  }

  Future login(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://Httpraya-backend.com/api/login'),
      body: {"email": email, "password": password},
      headers: {"Accept": "application/json"},
    );

    var jsonResponse = await json.decode(response.body);

    if (response.statusCode == 200) {
      Provider.of<userProvider>(context, listen: false).isLoggedIn = true;

      User user = User(
        email: email,
        password: password,
        token: jsonResponse["data"]['access_token'],
        id: jsonResponse['data']['user']['id'],
        name: jsonResponse['data']['user']['name'],
        mobile: jsonResponse['data']['user']['mobile'],
        city: jsonResponse['data']['user']['city'],
        street: jsonResponse['data']['user']['street'],
        area: jsonResponse['data']['user']['area'],
        building: jsonResponse['data']['user']['building'],
        landmarks: jsonResponse['data']['user']['landmarks'],
        crm_user_id: jsonResponse['data']['user']['crm_user_id'],
      );

      Provider.of<userProvider>(context, listen: false).userData = user;
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const BuyCategories()));
      Navigator.pop(context, true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kPrimaryColor,
          content: Text(
            'Logged In Successfully!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } else {
      Provider.of<userProvider>(context, listen: false).isLoggedIn = false;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kPrimaryColor,
          content: Text(
            'Wrong Email or Password!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      print(jsonResponse);
    }
  }
}
