import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raya/screens/layout/colors.dart';

import 'package:raya/models/UserModel.dart';
import 'package:raya/providers/PaymentsProvider.dart';
import 'package:raya/screens/layout/appBar.dart';

import 'package:raya/screens/maintenance/order_confirmation_maint.dart';
import 'package:raya/screens/maintenance/buy_steps.dart';

import '../../providers/userProvider.dart';

class MaintPayType extends StatefulWidget {
  final vinnumner;
  // final User user;

  MaintPayType({Key? key, this.vinnumner}) : super(key: key);

  @override
  State<MaintPayType> createState() => _MaintPayTypeState();
}

class _MaintPayTypeState extends State<MaintPayType> {
  // final cityController = TextEditingController();
  String type = '';
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
                'Repair Type'.toUpperCase(),
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
                        setState(() {
                          type = 'On-site Repair';
                          ;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BuySteps(
                              vinnumber: widget.vinnumner,
                              type: type,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'On-site Repair'.toUpperCase(),
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                        setState(() {
                          type = 'Transportation';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BuySteps(
                              vinnumber: widget.vinnumner,
                              type: type,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Transportation'.toUpperCase(),
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                        setState(() {
                          type = 'Insurance Renewal';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BuySteps(
                              vinnumber: widget.vinnumner,
                              type: type,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Insurance Renewal'.toUpperCase(),
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
