import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:vinokhatek/models/services/common_data_provider.dart';

class LocationService {
  LocationService();

  static Future<Position> getLocation() async {
    print("Start : " + DateTime.now().toString());

    Position? position;
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission != LocationPermission.whileInUse ||
        permission != LocationPermission.always) {
      print('Location access granted');
    }
    bool locationService = await Geolocator.isLocationServiceEnabled();
    if (!locationService) {
      await Geolocator.openLocationSettings();
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }
    print("End : " + DateTime.now().toString());
    return position!;
  }

  // static Future<List<Address?>> getAddressFromCoordinates(
  //     double lat, double long) async {
  //   print("Start : " + DateTime.now().toString());
  //   List<Address> addresses = await Geocoder.local
  //       .findAddressesFromCoordinates(Coordinates(lat, long));
  //   print("End : " + DateTime.now().toString());
  //   return addresses;
  // }
}
