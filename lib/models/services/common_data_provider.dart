import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class CommonDataProvider extends ChangeNotifier {
  List<Placemark?>? _placemarks;
  List<Placemark?>? get placemarks => _placemarks;

  void addPlacemark(List<Placemark?>? val) {
    _placemarks = val;
    notifyListeners();
  }

  bool? _isAdmin;
  bool? get isAdmin => _isAdmin;

  void adminCheck(bool? val) {
    _isAdmin = val;
    notifyListeners();
  }

  bool? _isRemember = false;
  bool? get isRemember => _isRemember;

  void isremember() {
    _isRemember = !isRemember!;
    notifyListeners();
  }

  String? _emailID;
  String? get emailID => _emailID;

  void addEmailID(String? val) {
    _emailID = val;
    notifyListeners();
  }

  String? _password;
  String? get password => _password;

  void addpassword(String? val) {
    _password = val;
    notifyListeners();
  }

  List<int?>? _addedGarments=[];
  List<int?>? get addedGarments => _addedGarments;

  void addSelectedGarments(int? id) {
    _addedGarments?.add(id);
    notifyListeners();
  }

  void removeSelectedGarments(int? id) {
    _addedGarments?.remove(id);
    notifyListeners();
  }

  void emptySelectedGarments() {
    _addedGarments = [];
    notifyListeners();
  }
}
