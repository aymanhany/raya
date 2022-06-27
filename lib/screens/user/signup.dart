// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:raya/screens/layout/appBar.dart';
import 'package:raya/screens/layout/basebottombar.dart';
import 'package:raya/screens/layout/colors.dart';

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:raya/screens/user/login.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _signup = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _mobileController = TextEditingController();

  final TextEditingController _streetController = TextEditingController();

  final TextEditingController _cityController = TextEditingController();

  final TextEditingController _areaController = TextEditingController();

  final TextEditingController _buildingController = TextEditingController();

  final TextEditingController _passwordconfController = TextEditingController();

  final TextEditingController _landController = TextEditingController();

  var erroswidgets = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
                'Sign Up'.toUpperCase(),
                style: TextStyle(color: kPrimaryColor, fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height + 280,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/BG.png'), fit: BoxFit.fill, alignment: Alignment.bottomCenter),
              ),
              child: Form(
                key: _signup,
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
                          controller: _nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty || !RegExp(r"\b([-,a-z. ']+[ ]*)+").hasMatch(value)) {
                              return 'Please enter your Name';
                            }
                            return null;
                          },
                          maxLines: 1,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Name',
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
                              Icons.text_fields,
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
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          controller: _passwordconfController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Password again';
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
                              Icons.file_copy,
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
                          controller: _mobileController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !RegExp(r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$").hasMatch(value) ||
                                value.length > 11 ||
                                value.length < 11) {
                              return 'Please enter your Mobile';
                            }
                            return null;
                          },
                          maxLines: 1,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Mobile',
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
                              Icons.mobile_friendly,
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
                          controller: _cityController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your City';
                            }
                            return null;
                          },
                          maxLines: 1,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'City',
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
                          controller: _streetController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Street';
                            }
                            return null;
                          },
                          maxLines: 1,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Street',
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
                              Icons.streetview,
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
                          controller: _areaController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Area';
                            }
                            return null;
                          },
                          maxLines: 1,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Area',
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
                              Icons.place,
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
                          controller: _buildingController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Building';
                            }
                            return null;
                          },
                          maxLines: 1,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Building',
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
                              Icons.build,
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
                          controller: _landController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Landmarks';
                            }
                            return null;
                          },
                          maxLines: 1,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Landmarks',
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
                              Icons.landscape,
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
                            if (_signup.currentState!.validate()) {
                              sinup(
                                _emailController.text.toString(),
                                _passwordController.text.toString(),
                                _nameController.text.toString(),
                                _streetController.text.toString(),
                                _mobileController.text.toString(),
                                _passwordconfController.text.toString(),
                                _cityController.text.toString(),
                                _areaController.text.toString(),
                                _buildingController.text.toString(),
                                _landController.text.toString(),
                              );
                            }
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Column(
                          children: erroswidgets,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        'have an account? Login',
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

  Future sinup(
    String email,
    String password,
    String name,
    String street,
    String mobile,
    String passwordconf,
    String city,
    String area,
    String building,
    String land,
  ) async {
    final response = await http.post(
      Uri.parse('https://Httpraya-backend.com/api/register'),
      body: {
        "email": email,
        "password": password,
        "name": name,
        "street": street,
        "lang": "en",
        "mobile": mobile,
        "password_confirmation": passwordconf,
        "city": city,
        "area": area,
        "building": building,
        "landmarks": land,
      },
      headers: {"Accept": "application/json"},
    );
    var data = await json.decode(response.body);

    if (response.statusCode == 200) {
      // Provider.of<userProvider>(context, listen: false).isLoggedIn = true;

      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const BuyCategories()));
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kPrimaryColor,
          content: Text(
            'Signed up Successfully!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } else {
      // Provider.of<userProvider>(context, listen: false).isLoggedIn = false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kPrimaryColor,
          content: Text(
            'Wrong Data',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      var holder = <Widget>[];
      data["errors"].forEach((key, value) {
        var widget = Padding(
            padding: EdgeInsets.only(bottom: 5, top: 5),
            child: Text(
              value[0].toString(),
              style: TextStyle(fontSize: 12, color: Colors.red),
              textAlign: TextAlign.center,
            ));
        holder.add(widget);
      });

      setState(() {
        erroswidgets = holder;
      });
    }
  }
}
