import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raya/models/UserModel.dart';
import 'package:raya/screens/layout/colors.dart';
import 'package:raya/main.dart';
import 'package:raya/models/CarModel.dart';
import 'package:raya/providers/carsProvider.dart';
import 'package:raya/providers/locationProvider.dart';
import 'package:raya/screens/layout/appBar.dart';

import '../../providers/PaymentsProvider.dart';

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class OrderThanks extends StatefulWidget {
  OrderThanks({Key? key}) : super(key: key);

  @override
  State<OrderThanks> createState() => _OrderThanksState();
}

class _OrderThanksState extends State<OrderThanks> {
  // final cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // new Future.delayed(const Duration(seconds: 2), () {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
    // });
    return Scaffold(
      appBar: BaseAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/BG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: kPrimaryColor, width: 1), shape: BoxShape.circle),
                      width: 30,
                      height: 30,
                      child: Icon(
                        Icons.location_pin,
                        color: kPrimaryColor,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5 - 90,
                      height: 1,
                      color: kPrimaryColor,
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: kPrimaryColor, width: 1), shape: BoxShape.circle),
                      width: 30,
                      height: 30,
                      child: Icon(
                        Icons.currency_exchange,
                        color: kPrimaryColor,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5 - 90,
                      height: 1,
                      color: kPrimaryColor,
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: kPrimaryColor, width: 1), shape: BoxShape.circle),
                      width: 30,
                      height: 30,
                      child: Icon(
                        Icons.check,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Someone from the Customer Service will contact you regarding your request',
                  style: TextStyle(fontSize: 22, color: kPrimaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: Container(
                    color: kPrimaryColor,
                    child: Text(
                      'Go to Home Page',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
