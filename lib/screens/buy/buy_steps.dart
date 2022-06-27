import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raya/models/UserModel.dart';
import 'package:raya/providers/userProvider.dart';
import 'package:raya/screens/layout/basebottombar.dart';
import 'package:raya/screens/layout/colors.dart';
import 'package:raya/models/CarModel.dart';
import 'package:raya/providers/locationProvider.dart';
import 'package:raya/screens/layout/appBar.dart';
import 'package:raya/screens/buy/buy_steps_payment.dart';

class BuySteps extends StatefulWidget {
  final carsList carData;

  BuySteps({Key? key, required this.carData}) : super(key: key);

  @override
  State<BuySteps> createState() => _BuyStepsState();
}

class _BuyStepsState extends State<BuySteps> {
  final int _stepIndex = 0;

  final isExpanded = false;

  final cityController = TextEditingController();

  final areaController = TextEditingController();

  final buildingController = TextEditingController();

  final descriptionController = TextEditingController();

  final mobileController = TextEditingController();

  final streetController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<userProvider>(context, listen: false).userDataGetter;
    var checkedValue;

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
                      color: Colors.grey,
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 1), shape: BoxShape.circle),
                      width: 30,
                      height: 30,
                      child: Icon(
                        Icons.currency_exchange,
                        color: Colors.grey,
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
                'Location'.toUpperCase(),
                style: TextStyle(fontSize: 34, color: kPrimaryColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(width: 2, color: kPrimaryColor)),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: kPrimaryColor,
                            size: kDefaultFontSize * 1.5,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Enter location'.toUpperCase(),
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: kDefaultFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Material(
                                elevation: 2,
                                shadowColor: kBorderColor,
                                borderRadius: BorderRadius.circular(10),
                                child: TextFormField(
                                  maxLines: 1,
                                  controller: cityController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'this field is required';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: 'City',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Material(
                                elevation: 2,
                                shadowColor: kBorderColor,
                                borderRadius: BorderRadius.circular(10),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'this field is required';
                                    }
                                    return null;
                                  },
                                  maxLines: 1,
                                  controller: areaController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: 'Area',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Material(
                                elevation: 2,
                                shadowColor: kBorderColor,
                                borderRadius: BorderRadius.circular(10),
                                child: TextFormField(
                                  maxLines: 1,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'this field is required';
                                    }
                                    return null;
                                  },
                                  controller: buildingController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: 'Building',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Material(
                          elevation: 2,
                          shadowColor: kBorderColor,
                          borderRadius: BorderRadius.circular(10),
                          child: TextFormField(
                            maxLines: 1,
                            controller: streetController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'this field is required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Street',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Material(
                          elevation: 2,
                          shadowColor: kBorderColor,
                          borderRadius: BorderRadius.circular(10),
                          child: TextFormField(
                            controller: descriptionController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'this field is required';
                              }
                              return null;
                            },
                            minLines: 3,
                            maxLines: 6,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Description & Landmarks',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Material(
                          elevation: 2,
                          shadowColor: kBorderColor,
                          borderRadius: BorderRadius.circular(10),
                          child: TextFormField(
                            maxLines: 1,
                            controller: mobileController,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$").hasMatch(value) ||
                                  value.length > 11 ||
                                  value.length < 11) {
                                return 'this field is required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Mobile Number',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Provider.of<LocationProvider>(context, listen: false).city = cityController.text.toString();
                      Provider.of<LocationProvider>(context, listen: false).area = areaController.text.toString();
                      Provider.of<LocationProvider>(context, listen: false).building = buildingController.text.toString();
                      Provider.of<LocationProvider>(context, listen: false).street = streetController.text.toString();
                      Provider.of<LocationProvider>(context, listen: false).description = descriptionController.text.toString();
                      Provider.of<LocationProvider>(context, listen: false).mobile = mobileController.text;
                      Provider.of<LocationProvider>(context, listen: false).locationValue = checkedValue;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BuyStepsPayment(
                            carData: widget.carData,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: kPrimaryColor,
                          content: Text(
                            'All Fields are Required!',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Proceed'.toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
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
