import 'package:ecommerce_app/helper/storage_helper.dart';
import 'package:ecommerce_app/models/user_model.dart';
import 'package:ecommerce_app/services/auth/forgot_password_service.dart';
import 'package:flutter/material.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  final ForgotPasswordService _forgotPasswordService = ForgotPasswordService();

  bool _isLoading = false;
  String? _errorMessage;
  RegisterResponse? _response;
  User? _user;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  RegisterResponse? get response => _response;
  User? get user => _user;

  // Forgot Password Method
  Future<bool> forgotPassword({
    required String mobile,
    required String newPassword,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _response = await _forgotPasswordService.forgotPassword(
        mobile: mobile,
        newPassword: newPassword,
      );

      if (_response!.success) {
        _user = _response!.user;
        
        // Optionally save user data to SharedPreferences
        await SharedPreferencesHelper.saveUser(_user!);
        
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = _response!.message;
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Clear error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // Reset state
  void reset() {
    _isLoading = false;
    _errorMessage = null;
    _response = null;
    _user = null;
    notifyListeners();
  }
}