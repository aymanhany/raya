import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raya/models/UserModel.dart';
import 'package:raya/providers/userProvider.dart';
import 'package:raya/screens/layout/appBar.dart';
import 'package:raya/screens/layout/basebottombar.dart';
import 'package:raya/screens/layout/colors.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Notifications extends StatefulWidget {
  Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  var list;

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<userProvider>(context, listen: false).userDataGetter;
    return Scaffold(
      appBar: BaseAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: getNotifi(user.token),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data != null && snapshot.data.length > 0) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  if (snapshot.data[index]['user_id']['id'] == user.id) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding),
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
                        child: ListTile(
                          title: Text(snapshot.data[index]['message']),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 0,
                    );
                  }
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
      bottomNavigationBar: BaseBottomBar(),
    );
  }

  Future getNotifi(token) async {
    final response = await http.get(
      Uri.parse('https://Httpraya-backend.com/api/notifications'),
      headers: {"Accept": "application/json", "Authorization": "Bearer ${token}"},
    );
    var data = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      list = data['data']['data'];
      return list;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kPrimaryColor,
          content: Text(
            'Error!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      print(response.body);
    }
  }
}
