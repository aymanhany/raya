import 'package:flutter/cupertino.dart';

class LocationProvider extends ChangeNotifier {
  var city, area, street, building, description, mobile;

  var locationValue;
  get locationValueGetter => locationValue;
}
