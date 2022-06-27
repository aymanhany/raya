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

  get getNumberOfWeeks => numberOfWeeks;

  get getrentPrice => rentPrice;
  get onSiteGetter => onSite;
  get transGetter => trans;
  get insurGetter => insur;

  get StartDateGetter => start_date;
  get EndDateGetter => end_date;

  get paymentMethodGetter => paymentMethod;

  get paymentTokenGetter => paymentToken;
}
