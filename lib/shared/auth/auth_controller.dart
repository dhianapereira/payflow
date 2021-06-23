import 'package:flutter/material.dart';
import 'package:payflow/shared/utils/app_navigator.dart';

class AuthController {
  bool _isAuthenticated = false;
  dynamic _user;

  bool get isAuthenticated => _isAuthenticated;
  get user => _user;

  void setUser(BuildContext context, dynamic user) {
    if (user != null) {
      _user = user;
      _isAuthenticated = true;

      push(context, "/home", replace: true);
    } else {
      _isAuthenticated = false;
      push(context, "/login", replace: true);
    }
  }
}
