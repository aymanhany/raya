// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:raya/screens/layout/appBar.dart';
import 'package:raya/screens/layout/basebottombar.dart';
import 'package:raya/screens/layout/colors.dart';
import 'package:raya/screens/buy/Cars.dart';

class BuyInnerCategoriesGolf extends StatefulWidget {
  const BuyInnerCategoriesGolf({Key? key}) : super(key: key);

  @override
  State<BuyInnerCategoriesGolf> createState() => _BuyInnerCategoriesGolfState();
}

class _BuyInnerCategoriesGolfState extends State<BuyInnerCategoriesGolf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Text(
                'Choose your vehicle',
                style: TextStyle(
                    fontSize: 30,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                margin: EdgeInsets.symmetric(vertical: 20),
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage('images/BG.png'),
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Cars(catName: "winds")));
                      },
                      child: Container(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height * .15,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(16, 0, 0, 0),
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                      offset: Offset(0, 6),
                                    ),
                                  ]),
                            ),
                            Container(
                              // height: MediaQuery.of(context).size.height * .15,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0, left: 30),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Image.asset(
                                            'images/Wind-Logo.png',
                                            width: 100,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'S-SERIRES',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: kPrimaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 30.0),
                                      child: Image.asset(
                                        'images/Cart.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Cars(catName: "windz")));
                      },
                      child: Container(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height * .15,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(16, 0, 0, 0),
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                      offset: Offset(0, 6),
                                    ),
                                  ]),
                            ),
                            Container(
                              // height: MediaQuery.of(context).size.height * .15,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0, left: 30),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Image.asset(
                                            'images/Wind-Logo.png',
                                            width: 100,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Z-SERIRES',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: kPrimaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 30.0),
                                      child: Image.asset(
                                        'images/CarPic-1.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BaseBottomBar(),
    );
  }
}
