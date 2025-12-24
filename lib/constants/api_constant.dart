// class ApiConstants {
//   static const String baseUrl = 'http://31.97.206.144:3081';
//   static const String apiPath = '/api';

//   static const String register = '$baseUrl$apiPath/users/register';
//   static const String login = '$baseUrl$apiPath/users/login';
//   static const String forgotpassword='$baseUrl/users/forgotpassword';

//   static Map<String, String> get headers => {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//   };

//   static Map<String, String> getAuthHeaders(String token) => {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//     'Authorization': 'Bearer $token',
//   };
// }

class ApiConstants {
  static const String baseUrl = 'http://31.97.206.144:3081';
  static const String apiPath = '/api';

  static const String register = '$baseUrl$apiPath/users/register';
  static const String login = '$baseUrl$apiPath/users/login';
  static const String forgotpassword = '$baseUrl$apiPath/users/forgotpassword';
  static const String getUserprofle =
      '$baseUrl$apiPath/users/userprofile/userId';
  static const String updateProfile =
      '$baseUrl$apiPath/users/upload-profile/userId';
  static const String addlocation = '$baseUrl$apiPath/users/add-location';

  static Map<String, String> get headers => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static String getImageUrl(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return 'https://i.pravatar.cc/150?img=3';
    }

    if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
      return imagePath;
    }

    return '$baseUrl/$imagePath';
  }

  static Map<String, String> getAuthHeaders(String token) => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
}
