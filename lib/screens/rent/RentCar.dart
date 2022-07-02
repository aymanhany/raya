import 'dart:ffi';

import 'package:raya/providers/PaymentsProvider.dart';
import 'package:raya/screens/layout/appBar.dart';
import 'package:raya/screens/layout/basebottombar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raya/screens/layout/colors.dart';
import 'package:raya/models/CarModel.dart';
import 'package:raya/providers/carsProvider.dart';
import 'package:raya/providers/userProvider.dart';
import 'package:raya/screens/rent/buy_steps.dart';
import 'package:raya/screens/user/login.dart';

class RentCar extends StatefulWidget {
  final carsList carData;

  RentCar({Key? key, required this.carData}) : super(key: key);

  @override
  State<RentCar> createState() => _RentCarState();
}

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}

class _RentCarState extends State<RentCar> {
  List<DateTime> days = [];

  var testdata = DateTime.saturday % 7;
  var colorss = {
    'black': Colors.black,
    'blue': Colors.blue,
    'red': Color(0xFF7e0200),
    'white': Colors.white,
    'green': Color(0XFF626749),
    'silver': Color(0XFFbfbab5),
    'grey': Color(0XFF8e8b86),
    'light-blue': Colors.lightBlue,
    'dark-blue': Color(0XFF0e1a58),
    'brown': Color(0XFF6d4b37),
    'champange': Color(0XFFb39e86),
    'yellow': Color(0xFFf96614),
  };
  late String _startDate, _endDate;

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    int firstDayOfWeek = args.value.startDate.weekday % 7;
    int endDayOfWeek = (firstDayOfWeek + 6) % 7;
    endDayOfWeek = endDayOfWeek < 0 ? 7 : endDayOfWeek;
    PickerDateRange ranges = args.value;
    DateTime date1 = ranges.startDate!;
    DateTime date2 = (ranges.endDate ?? ranges.startDate!.add(Duration(days: 6)));
    if (date1.isAfter(date2)) {
      var date = date1;
      date1 = date2;
      date2 = date.add(Duration(days: 6));
    }
    int day1 = date1.weekday % 7;
    int day2 = date2.weekday % 7;

    // DateTime dat1 = date1.add(Duration(days: (firstDayOfWeek - day1)));
    DateTime dat1 = date1.add(Duration(days: (firstDayOfWeek - day1)));
    DateTime dat2 = date2.add(Duration(days: (endDayOfWeek - day2)));

    bool isSameDate(dynamic date1, dynamic date2) {
      if (date2 == date1) {
        return true;
      }

      if (date1 == null || date2 == null) {
        return false;
      }

      return date1.month == date2.month && date1.year == date2.year && date1.day == date2.day;
    }

    if (!isSameDate(dat1, ranges.startDate) || !isSameDate(dat2, ranges.endDate)) {
      _controller.selectedRange = PickerDateRange(dat1, dat2);
    }

    _startDate = ranges.startDate.toString();
    _endDate = (ranges.endDate.toString() ?? ranges.startDate!.add(Duration(days: 6)).toString());
  }

  late DateRangePickerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = DateRangePickerController();
  }

  List<DateTime> getDaysInBeteween(DateTime start, DateTime end) {
    for (int i = 0; i <= end.difference(start).inDays; i++) {
      days.add(DateTime(
          start.year,
          start.month,
          // In Dart you can set more than. 30 days, DateTime will do the trick
          start.day + i));
    }

    return days;
  }

  // List<DateTime> getDaysInBeteweenprov(DateTime start, DateTime end) {
  //   for (int i = 0; i <= end.difference(start).inDays; i++) {
  //     days.add(DateTime(
  //         start.year,
  //         start.month,
  //         // In Dart you can set more than. 30 days, DateTime will do the trick
  //         start.day + i));
  //   }

  //   Provider.of<PaymentsProvider>(context, listen: false).numberOfWeeks = days.length ~/ 7;

  //   return days;
  // }

  @override
  Widget build(BuildContext context) {
    // if (args.value % 7 != 0) {
    //   controller.selectedRange;
    // }

    widget.carData.rents.forEach((element) {
      DateTime start = DateTime.parse(element['start_date']);
      DateTime end = DateTime.parse(element['end_date']);

      getDaysInBeteween(start, end);
      // dates.add(end);
    });

    var colors = <Widget>[];
    widget.carData.color.forEach((element) {
      // final value = element.value;
      // for (final entry in colorss.entries) {
      //   final value = entry.value;
      // }
      var color = colorss[element];
      colors.add(GestureDetector(
        onTap: () {
          Provider.of<carsProvider>(context, listen: false).selectedColor = color;
        },
        child: Container(
          margin: EdgeInsets.only(left: 5),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black12, width: 2),
          ),
        ),
      ));
    });

    return Scaffold(
      appBar: BaseAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/BG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Card(
              clipBehavior: Clip.none,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://raya.akwadweb.com/storage/rentals/${widget.carData.id}/${widget.carData.pics.first}',
                      height: 200,
                    ),
                    // SizedBox(height: 10),
                    SizedBox(height: kDefaultPadding),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: widget.carData.price,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' EGP / week'.toUpperCase(),
                                        style: TextStyle(color: kPrimaryColor, fontSize: 18, fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.carData.name,
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding,
                          vertical: kDefaultPadding,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffF6F6F6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Colors',
                                style: TextStyle(color: kPrimaryColor, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Seg'),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 3,
                              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: colors),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: kDefaultPadding),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding,
                          vertical: kDefaultPadding,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffF6F6F6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('images/Body-Icon.png'),
                                SizedBox(width: kDefaultPadding),
                                Text(
                                  'Body'.toUpperCase(),
                                  style: TextStyle(color: kPrimaryColor, fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Seg'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: kDefaultPadding / 2,
                            ),
                            widget.carData.passenger_capacity.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'passenger capacity'.toCapitalized(),
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.passenger_capacity.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(height: 0),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.gross_weight.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Gross Weight',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.gross_weight.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.batteries.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Batteries',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.batteries.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.motor.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Motor',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.motor.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.max_speed.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Max Speed',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.max_speed.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.charger.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Charger',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.charger.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.charger_time.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Charger time',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.charger_time.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.range.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Range',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.range.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.step_board.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Step Board',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.step_board.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.controller.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Controller',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.controller.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.windshield.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Windshield',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.windshield.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.turning_radius.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Turning radius',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.turning_radius.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.climbing_capacity.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Climbing capacity',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.climbing_capacity.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.view_mirrors.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'View mirrors',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.view_mirrors.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.lights.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Lights',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.lights.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.speedometer.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Speedometer',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.speedometer.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.multimedia_system.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Multimedia system',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.multimedia_system.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.rear_armrest.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Rear armrest',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.rear_armrest.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.seats.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Seats',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.seats.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.dashboard.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Dashboard',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.dashboard.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.side_icebox.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Side icebox',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.side_icebox.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.golf_cart_cover.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Golf cart cover',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.golf_cart_cover.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.warranty_details.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Warranty details',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.warranty_details.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.driving_system.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Driving system',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.driving_system.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.lwh.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'L H W',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.lwh.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.suspension.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Suspension',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.suspension.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.payload.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Payload',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.payload.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.bumpers.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Bumpers',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.bumpers.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.tire.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Tire',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.tire.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.braking_system.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Braking system',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.braking_system.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            widget.carData.leadacid.toLowerCase() != 'test'
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'LeadAcid',
                                          style: TextStyle(
                                            color: Color(0xffb2b2b2),
                                            fontSize: kDefaultFontSize,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(widget.carData.leadacid.toCapitalized()),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      'Please select a date \n (minimum of a week and its duplications)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: kDefaultFontSize,
                      ),
                    ),

                    // Text(days.toString()),
                    Container(
                      padding: EdgeInsets.all(kDefaultPadding),
                      child: SfDateRangePicker(
                        enablePastDates: false,
                        view: DateRangePickerView.month,
                        onSelectionChanged: selectionChanged,
                        controller: _controller,
                        selectionMode: DateRangePickerSelectionMode.range,
                        selectableDayPredicate: (DateTime value) {
                          if (days.contains(value)) {
                            return false;
                          } else {
                            return true;
                          }
                        },
                      ),
                    ),
                    TextButton(
                      child: Container(
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          'Proceed'.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (Provider.of<userProvider>(context, listen: false).isLoggedInGetter == true) {
                          Provider.of<PaymentsProvider>(context, listen: false).start_date = _startDate;
                          Provider.of<PaymentsProvider>(context, listen: false).end_date = _endDate;
                          Provider.of<PaymentsProvider>(context, listen: false).getDaysInBeteweens(DateTime.parse(_startDate), DateTime.parse(_endDate));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BuySteps(
                                carData: widget.carData,
                              ),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BaseBottomBar(),
    );
  }

  PrintDate() {
    print(_startDate.toString());
    print(_endDate);
  }
}
