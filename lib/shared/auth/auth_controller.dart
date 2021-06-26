import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/utils/app_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      push(context, "/home", replace: true, arguments: user);
    } else {
      push(context, "/login", replace: true);
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString('user', user.toJson());
  }

  Future<void> logout() async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString('user', "");
    await GoogleSignIn(scopes: ['email']).signOut();
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 2));

    if (instance.containsKey('user')) {
      final json = instance.get("user") as String;

      setUser(context, UserModel.fromJson(json));
    } else {
      setUser(context, null);
    }
  }
}
