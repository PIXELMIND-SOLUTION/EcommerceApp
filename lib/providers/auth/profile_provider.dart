import 'package:ecommerce_app/helper/storage_helper.dart';
import 'package:ecommerce_app/services/auth/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/user_model.dart';


class ProfileProvider with ChangeNotifier {
  final ProfileService _profileService = ProfileService();
  
  User? _user;
  bool _isLoading = false;
  String? _errorMessage;

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Get user profile
  Future<void> getUserProfile(String userId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _user = await _profileService.getUserProfile(userId);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
      _user = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update profile
  Future<bool> updateProfile(String userId, String profileImagePath) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _user = await _profileService.updateProfile(userId, profileImagePath);
      _errorMessage = null;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Load user from shared preferences
  Future<void> loadUserFromPreferences() async {
    _isLoading = true;
    notifyListeners();

    try {
      _user = await SharedPreferencesHelper.getUser();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Clear user data
  void clearUser() {
    _user = null;
    _errorMessage = null;
    notifyListeners();
  }
}