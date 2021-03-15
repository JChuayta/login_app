import 'package:flutter/material.dart';
import 'package:login/models/user_model.dart';

class UserProvider with ChangeNotifier {
  User _user = new User();

  User get getUser => this._user;

  set setUser(User user) {
    this._user = user;
    notifyListeners();
  }
}
