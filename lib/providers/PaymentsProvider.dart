import 'package:flutter/cupertino.dart';

class PaymentsProvider extends ChangeNotifier {
  String api_key =
      "ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SndjbTltYVd4bFgzQnJJam94TnpNMk1qZ3NJbU5zWVhOeklqb2lUV1Z5WTJoaGJuUWlMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkudHhmcGFERU05b0dIblcxNjlzMkVFT0pPOTdrUEFldThpeWYzMW5jZi1FT3FxZ3RjTDJFUjgxMmJiMlFlVUNQNncydmd3Y3N3VFlxS1RRYXVnYldlR0E=";

  var paymentToken;

  var paymentMethod;

  var onSite = '';
  var trans = '';
  var insur = '';

  var start_date;
  var end_date;

  var rentPrice;

  var numberOfWeeks;

  get getrentPrice => rentPrice;
  get onSiteGetter => onSite;
  get transGetter => trans;
  get insurGetter => insur;

  get StartDateGetter => start_date;
  get EndDateGetter => end_date;

  get paymentMethodGetter => paymentMethod;

  get paymentTokenGetter => paymentToken;
  List<DateTime> daysForWeeks = [];

  List<DateTime> getDaysInBeteweens(DateTime start, DateTime end) {
    for (int i = 0; i <= end.difference(start).inDays; i++) {
      daysForWeeks.add(DateTime(
          start.year,
          start.month,
          // In Dart you can set more than. 30 days, DateTime will do the trick
          start.day + i));
    }
    numberOfWeeks = 0;
    numberOfWeeks = daysForWeeks.length ~/ 7;
    return daysForWeeks;
  }

  get getNumberOfWeeks => numberOfWeeks;
}
