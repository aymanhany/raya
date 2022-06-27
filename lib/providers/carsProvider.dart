import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/CarModel.dart';

class carsProvider extends ChangeNotifier {
  var selectedColor;
  var colorKey;
  late int selectedCar;
  get selectedColorGetter => selectedColor;
  get selectedColorKey => colorKey;
  get selectedCarGetter => selectedCar;

  Future<dynamic> getCars(catName) async {
    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(
      Uri.parse('https://Httpraya-backend.com/api/carts?cat={"cat": [{"cat_id": "${catName}"}]}'),
      headers: {"Accept": "application/json"},
    );

    var jsonResponse = await json.decode(response.body);

    List<carsList> cars = [];

    if (response.statusCode == 200) {
      for (var car in jsonResponse["data"]) {
        carsList Car = carsList(
          id: car['id'],
          name: car['name'],
          pics: car['pics'],
          rents: car['rentorder_id'] != null ? car['rentorder_id'] : ['rentorder_id'],
          passenger_capacity: car['passenger_capacity'],
          controller: car['controller'],
          batteries: car['batteries'],
          motor: car['motor'],
          charger: car['charger'],
          charger_time: car['charger_time'],
          range: car['range'],
          max_speed: car['max_speed'],
          windshield: car['windshield'],
          turning_radius: car['turning_radius'],
          climbing_capacity: car['climbing_capacity'],
          view_mirrors: car['view_mirrors'],
          lights: car['lights'],
          speedometer: car['speedometer'],
          multimedia_system: car['multimedia_system'],
          step_board: car['step_board'],
          rear_armrest: car['rear_armrest'],
          seats: car['seats'],
          dashboard: car['dashboard'],
          side_icebox: car['side_icebox'],
          golf_cart_cover: car['golf_cart_cover'],
          warranty_details: car['warranty_details'],
          driving_system: car['driving_system'],
          lwh: car['lwh'],
          suspension: car['suspension'],
          gross_weight: car['gross_weight'],
          payload: car['payload'],
          bumpers: car['bumpers'],
          tire: car['tire'],
          rim: car['rim'],
          braking_system: car['braking_system'],
          category: car['category'],
          price: car['price'],
          leadacid: car['leadacid'],
          type: car['type'] != null ? car['type'] : '',
          color: car['color'] != null ? car['color'].split(',') : ['black'],
        );
        cars.add(Car);
      }

      return cars;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<dynamic> getScooters() async {
    // Await the http get response: car[''], then decode the json-formatted response.
    final response = await http.get(
      Uri.parse(
          'https://Httpraya-backend.com/api/carts?cat={"cat": [{"cat_id": "spardus"}, {"cat_id": "slike"}, {"cat_id": "cumi"}, {"cat_id": "z3"}, {"cat_id": "em215"}]}'),
      headers: {"Accept": "application/json"},
    );

    var jsonResponse = await json.decode(response.body);

    List<carsList> cars = [];

    if (response.statusCode == 200) {
      for (var car in jsonResponse["data"]) {
        carsList Car = carsList(
          id: car['id'],
          name: car['name'],
          pics: car['pics'],
          rents: car['rentorder_id'] != null ? car['rentorder_id'] : ['rentorder_id'],
          passenger_capacity: car['passenger_capacity'],
          controller: car['controller'],
          batteries: car['batteries'],
          motor: car['motor'],
          charger: car['charger'],
          charger_time: car['charger_time'],
          range: car['range'],
          max_speed: car['max_speed'],
          windshield: car['windshield'],
          turning_radius: car['turning_radius'],
          climbing_capacity: car['climbing_capacity'],
          view_mirrors: car['view_mirrors'],
          lights: car['lights'],
          speedometer: car['speedometer'],
          multimedia_system: car['multimedia_system'],
          step_board: car['step_board'],
          rear_armrest: car['rear_armrest'],
          seats: car['seats'],
          dashboard: car['dashboard'],
          side_icebox: car['side_icebox'],
          golf_cart_cover: car['golf_cart_cover'],
          warranty_details: car['warranty_details'],
          driving_system: car['driving_system'],
          lwh: car['lwh'],
          suspension: car['suspension'],
          gross_weight: car['gross_weight'],
          payload: car['payload'],
          bumpers: car['bumpers'],
          tire: car['tire'],
          rim: car['rim'],
          braking_system: car['braking_system'],
          category: car['category'],
          price: car['price'],
          leadacid: car['leadacid'],
          type: car['type'] != null ? car['type'] : 'scooter',
          color: car['color'] != null ? car['color'].split(',') : ['black'],
        );
        cars.add(Car);
      }

      return cars;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    notifyListeners();
  }

  Future<dynamic> getRentals(cat) async {
    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(
      Uri.parse('https://Httpraya-backend.com/api/rentals?cat=${cat}'),
      headers: {"Accept": "application/json"},
    );

    var jsonResponse = await json.decode(response.body);

    List<carsList> cars = [];

    if (response.statusCode == 200) {
      // var id = jsonResponse["data"][0]["id"].toString();
      for (var car in jsonResponse["data"]) {
        carsList Car = carsList(
          id: car["id"].toString(),
          name: car['name'],
          pics: car['pics'],
          rents: car['rentorder_id'] != null ? car['rentorder_id'] : ['rentorder_id'],
          passenger_capacity: car['passenger_capacity'],
          controller: car['controller'],
          batteries: car['batteries'],
          motor: car['motor'],
          charger: car['charger'],
          charger_time: car['charger_time'],
          range: car['range'],
          max_speed: car['max_speed'],
          windshield: car['windshield'],
          turning_radius: car['turning_radius'],
          climbing_capacity: car['climbing_capacity'],
          view_mirrors: car['view_mirrors'],
          lights: car['lights'],
          speedometer: car['speedometer'],
          multimedia_system: car['multimedia_system'],
          step_board: car['step_board'],
          rear_armrest: car['rear_armrest'],
          seats: car['seats'],
          dashboard: car['dashboard'],
          side_icebox: car['side_icebox'],
          golf_cart_cover: car['golf_cart_cover'],
          warranty_details: car['warranty_details'],
          driving_system: car['driving_system'],
          lwh: car['lwh'],
          suspension: car['suspension'],
          gross_weight: car['gross_weight'],
          payload: car['payload'],
          bumpers: car['bumpers'],
          tire: car['tire'],
          rim: car['rim'],
          braking_system: car['braking_system'],
          category: car['category'] != null ? car['category'] : 'test',
          price: car['price'],
          leadacid: car['leadacid'],
          type: car['type'] != null ? car['type'] : 'rent',
          color: car['color'] != null ? car['color'].split(',') : ['black'],
        );
        cars.add(Car);
      }

      return cars;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
