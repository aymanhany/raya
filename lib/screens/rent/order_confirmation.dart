import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raya/models/UserModel.dart';
import 'package:raya/providers/userProvider.dart';
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

class OrderConfirmation extends StatefulWidget {
  final carsList carData;

  final User user;

  OrderConfirmation({Key? key, required this.carData, required this.user}) : super(key: key);

  @override
  State<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  // final cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final paymentMethod = Provider.of<PaymentsProvider>(context, listen: false).paymentMethodGetter;
    final colorKey = Provider.of<carsProvider>(context, listen: false).selectedColorKey;
    final weeks = Provider.of<PaymentsProvider>(context, listen: false).getNumberOfWeeks;
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
              Text(
                'Confirmation'.toUpperCase(),
                style: TextStyle(fontSize: 34, color: kPrimaryColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Image.network(
                              'https://raya.akwadweb.com/storage/rentals/${int.parse(widget.carData.id)}/${widget.carData.pics.first}',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.carData.name.toUpperCase(),
                                  style: TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Provider.of<carsProvider>(context).selectedColorGetter,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black12, width: 2),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${weeks} Weeks',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${int.parse(widget.carData.price.replaceAll(',', '')) * weeks} EGP',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Provider.of<LocationProvider>(context, listen: false).street.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              Provider.of<LocationProvider>(context, listen: false).city.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              Provider.of<LocationProvider>(context, listen: false).area.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Building No. ' + Provider.of<LocationProvider>(context, listen: false).building.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          Provider.of<LocationProvider>(context, listen: false).mobile.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        // Text('Order has been created!'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          Provider.of<PaymentsProvider>(context, listen: false).paymentMethodGetter.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () {
                  submitOrder(widget.carData, paymentMethod, widget.user, colorKey);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    'Confirm Order and back to home',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future submitOrder(data, paymentMethod, user, color) async {
    var colorString = color.toString();
    final weeks = Provider.of<PaymentsProvider>(context, listen: false).getNumberOfWeeks;
    final response = await http.post(
      Uri.parse('https://Httpraya-backend.com/api/rentorders'),
      body: {
        "lang": "en",
        "start_date": Provider.of<PaymentsProvider>(context, listen: false).start_date,
        "end_date": Provider.of<PaymentsProvider>(context, listen: false).end_date,
        "rental_id": "${data.id}",
        "payment": "${paymentMethod}",
        "location": "other-location",
        "city": Provider.of<LocationProvider>(context, listen: false).city,
        "area": Provider.of<LocationProvider>(context, listen: false).area,
        "building": Provider.of<LocationProvider>(context, listen: false).building,
        "street": Provider.of<LocationProvider>(context, listen: false).street,
        "landmarks": Provider.of<LocationProvider>(context, listen: false).description,
        "color": "${colorString}",
        "price": "${int.parse(widget.carData.price.replaceAll(',', '')) * weeks}",
        "mobile": "${user.mobile}",
      },
      headers: {"Accept": "application/json", "authorization": "Bearer " + user.token},
    );
    // var jsonResponse = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kPrimaryColor,
          content: Text(
            'Order has been created Successfully!',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MyHomePage();
          },
        ),
      );
      final crmAddDeal = await http.post(
        Uri.parse(
            'https://rayaauto.bitrix24.com/rest/8750/nfbbkk99zdgm037d/crm.deal.add.json?fields[TITLE]=Mobile App Rent / Cart = ${data.name}} / ${user.name} / ${user.mobile} / ${user.email} / ${paymentMethod}&fields[UF_CRM_1621838721]=127&fields[CATEGORY_ID]=0'),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kPrimaryColor,
          content: Text(
            'Order has been created Successfully!',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kPrimaryColor,
          content: Text(
            'error',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      );
      print(response.body);
    }
  }
}
