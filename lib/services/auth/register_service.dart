import 'dart:convert';
import 'package:ecommerce_app/constants/api_constant.dart';
import 'package:ecommerce_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // Register user
  static Future<RegisterResponse?> registerUser({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String mobile,
  }) async {
    try {
      final body = json.encode({
        'name': name,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'mobile': mobile,
      });

      final response = await http.post(
        Uri.parse(ApiConstants.register),
        headers: ApiConstants.headers,
        body: body,
      );


      print('response status code for registration ${response.statusCode}');
            print('response bodyyyyyyyyyyyy for registration ${response.body}');


      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        return RegisterResponse.fromJson(data);
      } else {
        print('Registration failed: ${response.statusCode}');
        print('Response: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error during registration: $e');
      return null;
    }
  }

  // Generic GET request
  static Future<Map<String, dynamic>?> get(String endpoint, {String? token}) async {
    try {
      final headers = token != null 
          ? ApiConstants.getAuthHeaders(token)
          : ApiConstants.headers;

      final response = await http.get(
        Uri.parse(endpoint),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('GET request failed: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error during GET request: $e');
      return null;
    }
  }

  // Generic POST request
  static Future<Map<String, dynamic>?> post(
    String endpoint,
    Map<String, dynamic> body,
    {String? token}
  ) async {
    try {
      final headers = token != null 
          ? ApiConstants.getAuthHeaders(token)
          : ApiConstants.headers;

      final response = await http.post(
        Uri.parse(endpoint),
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        print('POST request failed: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error during POST request: $e');
      return null;
    }
  }
}