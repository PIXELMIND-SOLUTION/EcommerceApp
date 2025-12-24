import 'dart:convert';
import 'package:ecommerce_app/constants/api_constant.dart';
import 'package:ecommerce_app/helper/storage_helper.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_app/models/user_model.dart';

class LoginService {
  // Login method
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.login),
        headers: ApiConstants.headers,
        body: json.encode({'email': email, 'password': password}),
      );

      final responseData = json.decode(response.body);

      print('response status code for login ${response.statusCode}');
      print('response bodyyyyyyyyyyyyyy for login ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (responseData['success'] == true) {
          // Parse user data
          final user = User.fromJson(responseData['user']);

          // Save user data and login status
          await SharedPreferencesHelper.saveUser(user);
          await SharedPreferencesHelper.setLoggedIn(true);

          if (responseData.containsKey('token')) {
            await SharedPreferencesHelper.saveToken(responseData['token']);
          }

          return {
            'success': true,
            'message': responseData['message'] ?? 'Login successful',
            'user': user,
          };
        } else {
          return {
            'success': false,
            'message': responseData['message'] ?? 'Login failed',
          };
        }
      } else {
        return {
          'success': false,
          'message': responseData['message'] ?? 'Server error occurred',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'An error occurred: ${e.toString()}',
      };
    }
  }

  // Logout method
  Future<bool> logout() async {
    try {
      await SharedPreferencesHelper.clearAll();
      return true;
    } catch (e) {
      print('Error during logout: $e');
      return false;
    }
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    return await SharedPreferencesHelper.isLoggedIn();
  }

  // Get current user
  Future<User?> getCurrentUser() async {
    return await SharedPreferencesHelper.getUser();
  }
}
