import 'package:flutter/foundation.dart';

class homeviewmodel extends ChangeNotifier {
  String _address;
  String get address => _address;
  String _imageSource;
  String get imageSource => _imageSource;
  String _owner;
  String get owner => _owner;
  bool _property;
  bool get property => _property;
  double _rent;
  double get rent => _rent;
  bool _rental;
  bool get rental => _rental;
  bool _saved;
  bool get saved => _saved;
  String _status;
  String get status => _status;
  

  homeviewmodel(this._address, this._owner, this._rent, this._status,
      this._imageSource, this._rental, this._saved, this._property);

  set address(String val) {
    _address = val;
    notifyListeners();
  }

  set imageSource(String val) {
    _imageSource = val;
    notifyListeners();
  }

  set rent(double val) {
    _rent = val;
    notifyListeners();
  }

  set saved(bool val) {
    _saved = val;
    notifyListeners();
  }

  set status(String val) {
    _status = val;
    notifyListeners();
  }
}
