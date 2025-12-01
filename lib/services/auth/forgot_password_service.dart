// import 'dart:convert';
// import 'package:ecommerce_app/constants/api_constant.dart';
// import 'package:ecommerce_app/models/user_model.dart';
// import 'package:http/http.dart' as http;


// class ForgotPasswordService {
//   // Forgot Password
//   Future<RegisterResponse> forgotPassword({
//     required String mobile,
//     required String newPassword,
//   }) async {
//     try {
//       final response = await http.post(
//         Uri.parse(ApiConstants.forgotpassword),
//         headers: ApiConstants.headers,
//         body: json.encode({
//           'mobile': mobile,
//           'newPassword': newPassword,
//         }),
//       );

//       final Map<String, dynamic> responseData = json.decode(response.body);


//       print('Response status code for forgot password ${response.statusCode}');
//             print('Response bodyyyyyyyyyyyyy for forgot password ${response.body}');


//       if (response.statusCode == 200) {
//         return RegisterResponse.fromJson(responseData);
//       } else {
//         throw Exception(
//           responseData['message'] ?? 'Failed to reset password',
//         );
//       }
//     } catch (e) {
//       throw Exception('Error: $e');
//     }
//   }
// }













import 'dart:convert';
import 'package:ecommerce_app/constants/api_constant.dart';
import 'package:ecommerce_app/models/user_model.dart';
import 'package:http/http.dart' as http;


class ForgotPasswordService {
  Future<RegisterResponse> forgotPassword({
    required String mobile,
    required String newPassword,
  }) async {
    try {
      print('Making request to: ${ApiConstants.forgotpassword}');
      print('Request body: ${json.encode({'mobile': mobile, 'newPassword': newPassword})}');

      final response = await http.post(
        Uri.parse(ApiConstants.forgotpassword),
        headers: ApiConstants.headers,
        body: json.encode({
          'mobile': mobile,
          'newPassword': newPassword,
        }),
      );

      print('Response status code for forgot password: ${response.statusCode}');
      print('Response bodyyy for forgot password: ${response.body}');

      // Check if response is HTML (error page)
      if (response.body.trim().toLowerCase().startsWith('<!doctype') || 
          response.body.trim().toLowerCase().startsWith('<html')) {
        throw Exception('Server returned an error page. Please check the API endpoint.');
      }

      // Try to decode JSON
      Map<String, dynamic> responseData;
      try {
        responseData = json.decode(response.body);
      } catch (e) {
        throw Exception('Invalid response format from server');
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        return RegisterResponse.fromJson(responseData);
      } else {
        throw Exception(
          responseData['message'] ?? 'Failed to reset password',
        );
      }
    } on FormatException catch (e) {
      print('Format Exception: $e');
      throw Exception('Invalid response format from server');
    } catch (e) {
      print('Error in forgotPassword: $e');
      throw Exception('Error: $e');
    }
  }
}