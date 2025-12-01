import 'package:ecommerce_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPreferencesHelper {
  static const String _keyUser = 'user_data';
  static const String _keyToken = 'auth_token';
  static const String _keyIsLoggedIn = 'is_logged_in';

  // Save user data
  static Future<bool> saveUser(User user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = json.encode(user.toJson());
      return await prefs.setString(_keyUser, userJson);
    } catch (e) {
      print('Error saving user: $e');
      return false;
    }
  }

  // Get user data
  static Future<User?> getUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString(_keyUser);
      if (userJson != null) {
        return User.fromJson(json.decode(userJson));
      }
      return null;
    } catch (e) {
      print('Error getting user: $e');
      return null;
    }
  }

  // Save auth token
  static Future<bool> saveToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.setString(_keyToken, token);
    } catch (e) {
      print('Error saving token: $e');
      return false;
    }
  }

  // Get auth token
  static Future<String?> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_keyToken);
    } catch (e) {
      print('Error getting token: $e');
      return null;
    }
  }

  // Save login status
  static Future<bool> setLoggedIn(bool value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.setBool(_keyIsLoggedIn, value);
    } catch (e) {
      print('Error setting login status: $e');
      return false;
    }
  }


  static Future<void> saveLocation(String location) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString("selectedLocation", location);
}

static Future<String?> getLocation() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString("selectedLocation");
}

  // Check if logged in
  static Future<bool> isLoggedIn() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_keyIsLoggedIn) ?? false;
    } catch (e) {
      print('Error checking login status: $e');
      return false;
    }
  }

  // Clear all data (logout)
  static Future<bool> clearAll() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.clear();
    } catch (e) {
      print('Error clearing preferences: $e');
      return false;
    }
  }

  // Remove specific key
  static Future<bool> remove(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(key);
    } catch (e) {
      print('Error removing key: $e');
      return false;
    }
  }
}
