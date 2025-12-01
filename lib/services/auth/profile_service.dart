import 'dart:convert';
import 'package:ecommerce_app/constants/api_constant.dart';
import 'package:ecommerce_app/helper/storage_helper.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_app/models/user_model.dart';

class ProfileService {
  // Get user profile
  Future<User?> getUserProfile(String userId) async {
    try {
      final token = await SharedPreferencesHelper.getToken();
      if (token == null) {
        throw Exception('No authentication token found');
      }

      final url = ApiConstants.getUserprofle.replaceAll('userId', userId);

      final response = await http.get(
        Uri.parse(url),
        headers: ApiConstants.getAuthHeaders(token),
      );

      print('response status code for get profile ${response.statusCode}');
      print('response  bodyyyyyyyyyyyyy for get profile ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true) {
          return User.fromJson(data['user']);
        } else {
          throw Exception(data['message'] ?? 'Failed to get profile');
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error getting profile: $e');
      rethrow;
    }
  }

  Future<User?> updateProfile(String userId, String profileImagePath) async {
    try {
      final url = ApiConstants.updateProfile.replaceAll('userId', userId);

      var request = http.MultipartRequest('POST', Uri.parse(url));

      // ❌ Don't add token
      // request.headers['Authorization'] = 'Bearer $token';

      // Add image
     request.files.add(
  await http.MultipartFile.fromPath(
    'profile',
    profileImagePath,
    contentType: http.MediaType('image', 'jpeg'), // FORCE MIME
  ),
);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      print('response status code for update profile ${response.statusCode}');
      print('response body for update profile ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true) {
          final updatedUser = User.fromJson(data['user']);

          // Optional: Save user without token
          await SharedPreferencesHelper.saveUser(updatedUser);

          return updatedUser;
        } else {
          throw Exception(data['message'] ?? 'Failed to update profile');
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating profile: $e');
      rethrow;
    }
  }

  // Update user profile
  // Future<User?> updateProfile(String userId, String profileImagePath) async {
  //   try {
  //     final token = await SharedPreferencesHelper.getToken();
  //     if (token == null) {
  //       throw Exception('No authentication token found');
  //     }

  //     final url = ApiConstants.updateProfile.replaceAll('userId', userId);

  //     var request = http.MultipartRequest('PUT', Uri.parse(url));

  //     // Add authorization header
  //     // request.headers['Authorization'] = 'Bearer $token';

  //     // Add profile image
  //     request.files.add(
  //       await http.MultipartFile.fromPath('profile', profileImagePath),
  //     );

  //     final streamedResponse = await request.send();
  //     final response = await http.Response.fromStream(streamedResponse);

  //     print('response status code for update profile ${response.statusCode}');
  //     print('response  bodyyyyyyyyyyyyy for update profile ${response.body}');

  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       if (data['success'] == true) {
  //         final updatedUser = User.fromJson(data['user']);
  //         // Update user in shared preferences
  //         await SharedPreferencesHelper.saveUser(updatedUser);
  //         return updatedUser;
  //       } else {
  //         throw Exception(data['message'] ?? 'Failed to update profile');
  //       }
  //     } else {
  //       throw Exception('Server error: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error updating profile: $e');
  //     rethrow;
  //   }
  // }
}
