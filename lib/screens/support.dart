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
import 'package:url_launcher/url_launcher_string.dart';

class Support extends StatefulWidget {
  Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<userProvider>(context).userDataGetter;
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
                'Support'.toUpperCase(),
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
                          controller: _messageController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a message';
                            }
                            return null;
                          },
                          maxLines: 8,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            fillColor: Colors.white,
                            alignLabelWithHint: true,
                            filled: true,
                            labelText: 'Message',
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
                              sendMessage(_messageController.text.toString(), user.token, user.id);
                            }
                          },
                          child: Text(
                            'Send',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () => launchUrlString("tel://15547"),
                        child: Text(
                          'Or 15547',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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

  Future sendMessage(String message, token, id) async {
    final response = await http.post(
      Uri.parse('https://Httpraya-backend.com/api/supports'),
      body: {"message": "${message}", "user_id": "${id}"},
      headers: {"Accept": "application/json", "Authorization": "Bearer " + token},
    );
    var jsonResponse = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kPrimaryColor,
          content: Text(
            'Message sent sucessfully!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kPrimaryColor,
          content: Text(
            'Please enter a message!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      print(jsonResponse);
    }
  }
}
