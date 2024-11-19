import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UiProvider extends ChangeNotifier {
  bool _isChecked = false;
  bool get isChecked => _isChecked;

  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;

  late SharedPreferences storage;

  //Method to check and uncheck remember me
  toggleCheck() {
    _isChecked = !isChecked;
    notifyListeners();
  }

  //When login is successful, then we will true the value to remember our session
  setRememberMe() {
    _rememberMe = true;

    //We store the value in secure storage to be remembered
    storage.setBool("rememberMe", _rememberMe);
    notifyListeners();
  }

  //Set rememberMe vallue to false
  logout() {
    _rememberMe = false;
    storage.setBool("rememberMe", _rememberMe);
    notifyListeners();
  }

  //Init Secure Storage
  InitStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _rememberMe = prefs.getBool("rememberMe") ?? false;
  }
}
