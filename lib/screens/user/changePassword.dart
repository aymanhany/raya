// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raya/screens/layout/colors.dart';
import 'package:raya/main.dart';
import 'package:raya/models/UserModel.dart';
import 'package:raya/providers/userProvider.dart';

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:raya/screens/user/signup.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _current_password = TextEditingController();
  final TextEditingController _new_password = TextEditingController();
  final TextEditingController _password_confirmation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.1,
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.notifications),
              color: kPrimaryColor,
              onPressed: () {},
            ),
            title: Center(
                child: Image.asset(
              'images/Raya-Logo.png',
              width: MediaQuery.of(context).size.width * 0.2,
            )),
            actions: [
              IconButton(
                icon: Image.asset('images/Share-Icon.png'),
                color: kPrimaryColor,
                onPressed: () {},
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
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
                            controller: _current_password,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your old password';
                              }
                              return null;
                            },
                            maxLines: 1,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              fillColor: Colors.white,
                              filled: true,
                              labelText: 'Current Password',
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
                            controller: _new_password,
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
                              labelText: 'New Password',
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
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            controller: _password_confirmation,
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
                              labelText: 'Password Confirmation',
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
                                reset(_current_password.text.toString(), _new_password.text.toString(), _password_confirmation.text.toString());
                              }
                            },
                            child: Text(
                              'Reset Password',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, '/forget');
                        },
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
        ));
  }

  Future reset(current_password, new_password, password_confirmation) async {
    final response = await http.post(
      Uri.parse('https://Httpraya-backend.com/api/change/password'),
      body: {"current_password": current_password, "new_password": new_password, "password_confirmation": password_confirmation},
      headers: {"Accept": "application/json"},
    );
    var jsonResponse = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kPrimaryColor,
          content: Text(
            'Password Reset Done!',
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
    }
  }
}
