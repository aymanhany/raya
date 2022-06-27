// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raya/screens/layout/basebottombar.dart';
import 'package:raya/screens/layout/colors.dart';
import 'package:raya/providers/carsProvider.dart';
import 'package:raya/screens/buy/Car.dart';
import 'package:raya/screens/layout/appBar.dart';

class Cars extends StatelessWidget {
  var catName;

  Cars({Key? key, this.catName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding),
        // margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/BG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          clipBehavior: Clip.none,
          padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
          child: FutureBuilder(
            future: Provider.of<carsProvider>(context).getCars(catName),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                return GridView.builder(
                  clipBehavior: Clip.none,
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Car(
                              carData: snapshot.data[index],
                            ),
                          ),
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Container(
                          //   child: Text(snapshot.data[index].name),
                          // ),
                          Container(
                            clipBehavior: Clip.none,
                            width: MediaQuery.of(context).size.width * 0.44,
                            margin: EdgeInsets.only(bottom: 30),
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topCenter,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        offset: Offset(0, 0),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: -60,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.44,
                                    child: Image.network(
                                      'https://raya.akwadweb.com/storage/carts/${snapshot.data[index].id}/${snapshot.data[index].pics.first}',
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        snapshot.data[index].price + ' EGP',
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        snapshot.data[index].name,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Image.asset(
                                        'images/Wind-Logo.png',
                                        width: 70,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: BaseBottomBar(),
    );
  }
}
