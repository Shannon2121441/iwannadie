import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const String userKey = 'user';

  // Login method
  static Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://s2121441.helioho.st/login.php'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['status'] == 'success') {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString(userKey, jsonEncode(responseData['user']));
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userKey) != null;
  }

  // Logout method
  static Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(userKey);
  }

  // Get current user method
  static Future<Map<String, dynamic>?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(userKey);
    return userString != null ? jsonDecode(userString) : null;
  }

  // Get user ID method
  static Future<int?> getUserId() async {
    final user = await getUser();
    return user != null ? user['userId'] : null;
  }
}
