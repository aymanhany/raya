import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raya/screens/layout/colors.dart';
// import 'package:raya/screens/Car.dart';
import 'package:raya/screens/rent/RentCar.dart';
import 'package:raya/screens/layout/appBar.dart';

import '../../providers/carsProvider.dart';

class RentList extends StatefulWidget {
  final String seats;
  const RentList({Key? key, required this.seats}) : super(key: key);

  @override
  State<RentList> createState() => _RentListState();
}

class _RentListState extends State<RentList> {
  var catName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding),
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
            future: Provider.of<carsProvider>(context).getRentals(widget.seats),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                return GridView.builder(
                  clipBehavior: Clip.none,
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.05),
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RentCar(
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
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.44,
                                  child: Image.network(
                                    'https://raya.akwadweb.com/storage/rentals/${int.parse(snapshot.data[index].id)}/${snapshot.data[index].pics.first}',
                                    height: 150,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
