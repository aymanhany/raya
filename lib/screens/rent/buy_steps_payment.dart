import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raya/screens/layout/colors.dart';
import 'package:raya/models/CarModel.dart';
import 'package:raya/models/UserModel.dart';
import 'package:raya/providers/PaymentsProvider.dart';
import 'package:raya/screens/layout/appBar.dart';
import 'package:raya/screens/rent/order_confirmation.dart';
import 'package:raya/screens/rent/visa.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../../providers/userProvider.dart';

class BuyStepsPayment extends StatefulWidget {
  final carsList carData;
  final int weeks;

  BuyStepsPayment({Key? key, required this.carData, required this.weeks}) : super(key: key);

  @override
  State<BuyStepsPayment> createState() => _BuyStepsPaymentState();
}

class _BuyStepsPaymentState extends State<BuyStepsPayment> {
  // final cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<userProvider>(context, listen: false).userDataGetter;
    final carsList carData = widget.carData;
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
                      color: Colors.grey,
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 1), shape: BoxShape.circle),
                      width: 30,
                      height: 30,
                      child: Icon(
                        Icons.check,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Payment'.toUpperCase(),
                style: TextStyle(fontSize: 34, color: kPrimaryColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: kPrimaryColor),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Provider.of<PaymentsProvider>(context, listen: false).paymentMethod = 'Visa & Master Card';
                        var iframe = 380572;
                        getVisaApi(carData.price, user, iframe, widget.weeks);
                      },
                      child: Text(
                        'Visa & Master Card'.toUpperCase(),
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: kPrimaryColor),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Provider.of<PaymentsProvider>(context, listen: false).paymentMethod = 'Cash on delivery';
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderConfirmation(carData: widget.carData, user: user, weeks: widget.weeks),
                          ),
                        );
                      },
                      child: Text(
                        'cash on delivery'.toUpperCase(),
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future getVisaApi(price, user, iframe, weeks) async {
    var authToken;
    var orderId;

    var amount = (int.parse(price.replaceAll(',', '')) * 100) * weeks;
    // First Request
    final api_key = jsonEncode({
      "api_key":
          "ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SndjbTltYVd4bFgzQnJJam94TnpNMk1qZ3NJbU5zWVhOeklqb2lUV1Z5WTJoaGJuUWlMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkudHhmcGFERU05b0dIblcxNjlzMkVFT0pPOTdrUEFldThpeWYzMW5jZi1FT3FxZ3RjTDJFUjgxMmJiMlFlVUNQNncydmd3Y3N3VFlxS1RRYXVnYldlR0E="
    });

    //  GETTING AUTH TOKEN
    final authresponse = await http.post(
      Uri.parse('https://accept.paymob.com/api/auth/tokens'),
      headers: {"Content-Type": "application/json"},
      body: api_key,
    );

    var data = await jsonDecode(authresponse.body);

    if (authresponse.statusCode == 201) {
      authToken = data['token'];
      // REGISTRING ORDER AND GETTING ORDER ID
      final orderDataEncodded = jsonEncode({"auth_token": authToken, "delivery_needed": "false", "amount_cents": amount, "Items": ' ', "currency": "EGP"});
      final orderresponse = await http.post(
        Uri.parse('https://accept.paymobsolutions.com/api/ecommerce/orders'),
        headers: {"Content-Type": "application/json"},
        body: orderDataEncodded,
      );

      var orderData = await jsonDecode(orderresponse.body);

      if (orderresponse.statusCode == 201) {
        orderId = orderData['id'];

        // GETTING PAYMENT_KEY WITH POSTING ORDER ID AND AUTH TOKEN AND RECIVING TOKEN
        final paymentkeyDataEncodded = jsonEncode({
          "auth_token": authToken,
          "amount_cents": amount,
          "expiration": 3600,
          "order_id": orderId,
          "billing_data": {
            "phone_number": user.mobile,
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": user.city,
            "country": "NA",
            "first_name": user.name,
            "last_name": user.name,
            "email": user.email,
            "apartment": "NA",
            "street": user.street,
            "building": user.building,
            "floor": "NA",
            "state": "Utah"
          },
          "currency": "EGP",
          "integration_id": 2253586,
          "lock_order_when_paid": "false"
        });

        final paymentKey = await http.post(
          Uri.parse('https://accept.paymobsolutions.com/api/acceptance/payment_keys'),
          headers: {"Content-Type": "application/json"},
          body: paymentkeyDataEncodded,
        );
        var keyData = await jsonDecode(paymentKey.body);

        if (paymentKey.statusCode == 201) {
          final iframLink = await http.post(
            Uri.parse('https://Httpraya-backend.com/api/orders/payment'),
            headers: {"Accept": "application/json", "Authorization": "Bearer " + user.token},
            body: {
              "pt": keyData['token'],
              "nu": "${iframe}",
            },
          );

          // var iframData = await jsonDecode(iframLink.body);

          if (iframLink.statusCode == 200) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Visa(
                  url: iframLink.body,
                  carData: widget.carData,
                ),
              ),
            );
          } else {
            print(iframLink.body);
          }
        } else {
          print(paymentKey.body);
        }
      } else {
        print(orderresponse.body);
      }
    } else {
      print(authresponse.body);
    }
  }
}
