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
import 'package:raya/screens/maintenance/order_thanks.dart';

import '../../providers/PaymentsProvider.dart';

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class OrderConfirmationMaint extends StatefulWidget {
  var vinnumber;
  final type;
  OrderConfirmationMaint({Key? key, this.vinnumber, this.type}) : super(key: key);

  @override
  State<OrderConfirmationMaint> createState() => _OrderConfirmationMaintState();
}

class _OrderConfirmationMaintState extends State<OrderConfirmationMaint> {
  // final cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<userProvider>(context, listen: false).userDataGetter;
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
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'VIN Number ' + widget.vinnumber.toString(),
                                style: TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
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
                      children: [
                        Text(
                          widget.type,
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
                  subbmitOrder(user);
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

  Future subbmitOrder(user) async {
    var paymentMethod = Provider.of<PaymentsProvider>(context, listen: false).paymentMethodGetter;
    final response = await http.post(
      Uri.parse('https://Httpraya-backend.com/api/maintenances'),
      body: {
        "lang": "en",
        "vin": widget.vinnumber.toString(),
        "payment": "${paymentMethod}",
        "location": "other-location",
        "city": Provider.of<LocationProvider>(context, listen: false).city,
        "area": Provider.of<LocationProvider>(context, listen: false).area,
        "building": Provider.of<LocationProvider>(context, listen: false).building,
        "street": Provider.of<LocationProvider>(context, listen: false).street,
        "landmarks": Provider.of<LocationProvider>(context, listen: false).description,
      },
      headers: {"Accept": "application/json", "authorization": "Bearer " + user.token},
    );
    // var jsonResponse = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      // if (user.crm_user_id != 'empty') {
      //   final crmResponse = await http.post(
      //     Uri.parse('https://rayaauto.bitrix24.com/rest/8750/f08d4enj8c3gxqub/crm.contact.get.json'),
      //     body: {
      //       "id": "${user.crm_user_id}",
      //     },
      //   );
      //   var crmResponseJson = await jsonDecode(crmResponse.body);
      //   final crmAddDeal = await http.post(
      //     Uri.parse(
      //         'https://rayaauto.bitrix24.com/rest/8750/nfbbkk99zdgm037d/crm.deal.add.json?fields[CONTACT_ID]=${crmResponseJson['result']}&fields[NAME]=mobileApp.Maintenance/VIN=${widget.vinnumner.toString()}'),
      //   );

      //   print(crmResponseJson);
      // } else {
      //   final crmResponse = await http.post(
      //     Uri.parse('https://rayaauto.bitrix24.com/rest/8750/f08d4enj8c3gxqub/crm.contact.add.json?fields[NAME]=${user.name} ${user.mobile} ${user.email}'),
      //   );

      //   var crmResponseJson = await jsonDecode(crmResponse.body);

      //   final addCrmId = await http.post(Uri.parse('https://Httpraya-backend.com/api/edit/account'), headers: {
      //     "Accept": "application/json",
      //     "authorization": "Bearer " + user.token
      //   }, body: {
      //     "crm_user_id": crmResponseJson['result'].toString(),
      //   });

      //   var addCrmIdJson = await jsonDecode(addCrmId.body);
      //   if (addCrmId.statusCode == 200) {
      //     final crmAddDeal = await http.post(
      //       Uri.parse(
      //           'https://rayaauto.bitrix24.com/rest/8750/nfbbkk99zdgm037d/crm.deal.add.json?fields[CONTACT_ID]=${crmResponseJson['result'].toString()}&fields[NAME]=mobileApp.Maintenance/VIN=${widget.vinnumner.toString()}'),
      //     );
      //   }
      //   print(crmResponseJson);
      // }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return OrderThanks();
          },
        ),
      );

      final crmAddDeal = await http.post(
        Uri.parse(
            'https://rayaauto.bitrix24.com/rest/8750/nfbbkk99zdgm037d/crm.deal.add.json?fields[TITLE]=Mobile App Maintenance / VIN=${widget.vinnumber.toString()} / ${user.name} / ${user.mobile} / ${user.email} / ${widget.type} &fields[UF_CRM_1621838721]=484&fields[CATEGORY_ID]=11'),
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     backgroundColor: kPrimaryColor,
      //     content: Text(
      //       'Someone from the Customer Service will contact you regarding your request',
      //       style: TextStyle(color: Colors.white),
      //       textAlign: TextAlign.center,
      //     ),
      //   ),
      // );
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
