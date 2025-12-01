import 'package:ecommerce_app/helper/storage_helper.dart';
import 'package:ecommerce_app/models/user_model.dart';
import 'package:ecommerce_app/services/auth/register_service.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;
  String? _token;
  bool _isLoading = false;
  String? _errorMessage;

  User? get user => _user;
  String? get token => _token;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _user != null;

  // Initialize provider (check if user is logged in)
  Future<void> initialize() async {
    _isLoading = true;
    notifyListeners();

    try {
      final isLoggedIn = await SharedPreferencesHelper.isLoggedIn();
      if (isLoggedIn) {
        _user = await SharedPreferencesHelper.getUser();
        _token = await SharedPreferencesHelper.getToken();
      }
    } catch (e) {
      print('Error initializing auth provider: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  // Register user
  Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String mobile,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await ApiService.registerUser(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        mobile: mobile,
      );

      if (response != null && response.success) {
        _user = response.user;
        
        // Save to shared preferences
        await SharedPreferencesHelper.saveUser(response.user);
        await SharedPreferencesHelper.setLoggedIn(true);
        
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response?.message ?? 'Registration failed';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Logout
  Future<void> logout() async {
    _user = null;
    _token = null;
    _errorMessage = null;
    await SharedPreferencesHelper.clearAll();
    notifyListeners();
  }

  // Clear error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}