import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raya/models/UserModel.dart';
import 'package:raya/screens/layout/appBar.dart';
import 'package:raya/screens/layout/basebottombar.dart';
import 'package:raya/screens/layout/colors.dart';

import '../../providers/userProvider.dart';

import 'package:intl/intl.dart';

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<userProvider>(context).userDataGetter;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(width: 2, color: kPrimaryColor)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Name',
                  style: TextStyle(color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Mobile',
                  style: TextStyle(color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  user.mobile,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Email',
                  style: TextStyle(color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'City',
                  style: TextStyle(color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  user.city,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Area',
                  style: TextStyle(color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  user.area,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Street',
                  style: TextStyle(color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  user.street,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Landmarks',
                  style: TextStyle(color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  user.landmarks,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Buy Orders',
                  style: TextStyle(color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              FutureBuilder(
                future: userData(user.token),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ordered at ' + DateFormat('dd-MM-yyyy').format(DateTime.parse(snapshot.data['data'][0]['orders'][index]['created_at'])),
                                    style: TextStyle(fontSize: 16, color: kPrimaryColor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Payment Method \n' + snapshot.data['data'][0]['orders'][index]['payment'],
                                    style: TextStyle(fontSize: 16, color: kPrimaryColor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Color ' + snapshot.data['data'][0]['orders'][index]['color'],
                                    style: TextStyle(fontSize: 16, color: kPrimaryColor),
                                  ),
                                  Container(
                                    color: Colors.black12,
                                    height: 2,
                                    margin: EdgeInsets.only(top: 20, bottom: 20),
                                  ),
                                ],
                              )),
                          itemCount: snapshot.data['data'][0]['orders'].length),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 30),
                child: Text(
                  'Maintenance Orders',
                  style: TextStyle(color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              FutureBuilder(
                future: userData(user.token),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ordered at ' +
                                        DateFormat('dd-MM-yyyy').format(DateTime.parse(snapshot.data['data'][0]['maintenances'][index]['created_at'])),
                                    style: TextStyle(fontSize: 16, color: kPrimaryColor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Payment Method \n' + snapshot.data['data'][0]['maintenances'][index]['payment'],
                                    style: TextStyle(fontSize: 16, color: kPrimaryColor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    color: Colors.black12,
                                    height: 2,
                                    margin: EdgeInsets.only(top: 20, bottom: 20),
                                  ),
                                ],
                              )),
                          itemCount: snapshot.data['data'][0]['maintenances'].length),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 30),
                child: Text(
                  'Rental Orders',
                  style: TextStyle(color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              FutureBuilder(
                future: userData(user.token),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ordered at ' +
                                        DateFormat('dd-MM-yyyy').format(DateTime.parse(snapshot.data['data'][0]['rentorders'][index]['created_at'])),
                                    style: TextStyle(fontSize: 16, color: kPrimaryColor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Payment Method \n' + snapshot.data['data'][0]['rentorders'][index]['payment'],
                                    style: TextStyle(fontSize: 16, color: kPrimaryColor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    color: Colors.black12,
                                    height: 2,
                                    margin: EdgeInsets.only(top: 20, bottom: 20),
                                  ),
                                ],
                              )),
                          itemCount: snapshot.data['data'][0]['rentorders'].length),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BaseBottomBar(),
    );
  }

  Future userData(token) async {
    final response = await http.post(
      Uri.parse('https://Httpraya-backend.com/api/me'),
      headers: {"Accept": "application/json", "authorization": "Bearer ${token}"},
    );
    var jsonResponse = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      var data = jsonResponse;
      print(data);
      return data;
    } else {
      var data = jsonResponse;
      print(data);
      return data;
    }
  }
}
