import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raya/screens/layout/colors.dart';
import 'package:raya/main.dart';
import 'package:raya/models/CarModel.dart';
import 'package:raya/providers/carsProvider.dart';
import 'package:raya/providers/locationProvider.dart';
import 'package:raya/screens/maintenance/MaintPay.dart';
import 'package:raya/screens/layout/appBar.dart';
import 'package:raya/screens/maintenance/MaintPayType.dart';

import '../../providers/PaymentsProvider.dart';
import '../maintenance/buy_steps.dart';

class Maintenance extends StatelessWidget {
  Maintenance({Key? key}) : super(key: key);

  // final cityController = TextEditingController();
  // final areaController = TextEditingController();
  // final buildingController = TextEditingController();
  // final descriptionController = TextEditingController();
  // final mobileController = TextEditingController();
  final VINcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                'Maintenance'.toUpperCase(),
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
                child: TextFormField(
                  controller: VINcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a VIN Number';
                    }
                    return null;
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'VIN Number',
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
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      color: kPrimaryColor,
                      size: 30,
                    ),
                  ),
                  style: TextStyle(
                    color: kBorderColor,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (MaintPayType(vinnumner: VINcontroller.text)),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    'proceed'.toUpperCase(),
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
}
