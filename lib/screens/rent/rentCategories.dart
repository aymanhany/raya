// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:raya/screens/layout/appBar.dart';
import 'package:raya/screens/layout/basebottombar.dart';
import 'package:raya/screens/layout/colors.dart';
import 'package:raya/screens/Scooter.dart';
import 'package:raya/screens/buy/buyInnerCategoriesGolf.dart';
import 'package:raya/screens/rent/RentList.dart';

class RentCategories extends StatefulWidget {
  const RentCategories({Key? key}) : super(key: key);

  @override
  State<RentCategories> createState() => _RentCategoriesState();
}

class _RentCategoriesState extends State<RentCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                margin: EdgeInsets.symmetric(vertical: 20),
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(image: AssetImage('images/BG.png'), fit: BoxFit.cover, alignment: Alignment.bottomCenter),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RentList(seats: 'four')));
                      },
                      child: Container(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height * .15,
                              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20)), boxShadow: [
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
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 0, left: 30),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Image.asset(
                                            'images/Wind-Logo.png',
                                            width: 100,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Four Seats',
                                            style: TextStyle(fontSize: 20, color: kPrimaryColor, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 30.0),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RentList(seats: 'six')));
                      },
                      child: Container(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height * .15,
                              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20)), boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(16, 0, 0, 0),
                                  blurRadius: 15,
                                  spreadRadius: 8,
                                  offset: Offset(0, 0),
                                ),
                              ]),
                            ),
                            Container(
                              // height: MediaQuery.of(context).size.height * .15,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 30, top: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Image.asset(
                                            'images/Wind-Logo.png',
                                            width: 100,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Six Seats',
                                            style: TextStyle(fontSize: 20, color: kPrimaryColor, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 30.0),
                                      child: Image.asset(
                                        'images/Cartblue.png',
                                        // width: MediaQuery.of(context).size.width * .5,
                                        // height: MediaQuery.of(context).size.width * .3,
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
                    // Container(
                    //   child: Stack(
                    //     alignment: Alignment.bottomRight,
                    //     children: <Widget>[
                    //       Container(
                    //         height: MediaQuery.of(context).size.height * .15,
                    //         margin: EdgeInsets.symmetric(
                    //             horizontal: 20, vertical: 10),
                    //         decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(20)),
                    //             boxShadow: [
                    //               BoxShadow(
                    //                 color: Color.fromARGB(16, 0, 0, 0),
                    //                 blurRadius: 15,
                    //                 spreadRadius: 8,
                    //                 offset: Offset(0, 0),
                    //               ),
                    //             ]),
                    //       ),
                    //       Container(
                    //         // height: MediaQuery.of(context).size.height * .15,
                    //         child: Row(
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           mainAxisSize: MainAxisSize.max,
                    //           children: [
                    //             Expanded(
                    //               child: Padding(
                    //                 padding: const EdgeInsets.only(left: 30.0),
                    //                 child: Column(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.center,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   mainAxisSize: MainAxisSize.max,
                    //                   children: [
                    //                     Image.asset(
                    //                       'images/Yadea-Logo.png',
                    //                     ),
                    //                     SizedBox(height: 5),
                    //                     Text(
                    //                       'E-BIKE',
                    //                       style: TextStyle(
                    //                           fontSize: 20,
                    //                           color: kPrimaryColor,
                    //                           fontWeight: FontWeight.bold),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             Expanded(
                    //               child: Padding(
                    //                 padding: const EdgeInsets.only(right: 30.0),
                    //                 child: Image.asset('images/Bike.png',
                    //                     // width: MediaQuery.of(context).size.width * .5,
                    //                     height: 150,
                    //                     fit: BoxFit.fill),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BaseBottomBar(),
    );
  }
}
