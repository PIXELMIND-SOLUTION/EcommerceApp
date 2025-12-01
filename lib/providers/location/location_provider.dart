import 'package:ecommerce_app/helper/storage_helper.dart';
import 'package:ecommerce_app/services/location/location_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class LocationProvider extends ChangeNotifier {
  final LocationService _locationService = LocationService();

  bool _isLoading = false;
  String? _errorMessage;
  Position? _currentPosition;
  String? _currentAddress;
  Map<String, dynamic>? _locationResponse;

  // Getters
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  Position? get currentPosition => _currentPosition;
  String? get currentAddress => _currentAddress;
  Map<String, dynamic>? get locationResponse => _locationResponse;

  // Clear error
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // Set loading state
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Set error
  void _setError(String error) {
    _errorMessage = error;
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> checkLocationPermission() async {
    try {
      return await _locationService.handleLocationPermission();
    } catch (e) {
      _setError(e.toString());
      return false;
    }
  }

  // Get current location
  Future<void> getCurrentLocation() async {
    _setLoading(true);
    _errorMessage = null;

    try {
      _currentPosition = await _locationService.getCurrentPosition();
      
      // Get address
      if (_currentPosition != null) {
        _currentAddress = await _locationService.getAddressFromCoordinates(
          _currentPosition!.latitude,
          _currentPosition!.longitude,
        );
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _setError('Failed to get location: ${e.toString()}');
    }
  }

  // Add location to backend
  Future<bool> addLocation() async {
    _setLoading(true);
    _errorMessage = null;

    try {
      final user = await SharedPreferencesHelper.getUser();
      
      if (user == null) {
        _setError('User not found. Please login again.');
        return false;
      }

      // Get current location if not already fetched
      if (_currentPosition == null) {
        await getCurrentLocation();
      }

      if (_currentPosition == null) {
        _setError('Unable to get current location');
        return false;
      }

      // Add to backend
      _locationResponse = await _locationService.addLocationToBackend(
        userId: user.id,
        latitude: _currentPosition!.latitude,
        longitude: _currentPosition!.longitude,
      );

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _setError('Failed to add location: ${e.toString()}');
      return false;
    }
  }

  // Complete flow: Get location and add to backend
  Future<bool> getCurrentLocationAndAdd() async {
    _setLoading(true);
    _errorMessage = null;

    try {
      final user = await SharedPreferencesHelper.getUser();
      
      if (user == null) {
        _setError('User not found. Please login again.');
        return false;
      }

      final result = await _locationService.addCurrentLocation(user.id);
      
      _currentPosition = Position(
        latitude: result['latitude'],
        longitude: result['longitude'],
        timestamp: DateTime.now(),
        accuracy: 0,
        altitude: 0,
        altitudeAccuracy: 0,
        heading: 0,
        headingAccuracy: 0,
        speed: 0,
        speedAccuracy: 0,
      );
      
      _currentAddress = result['address'];
      _locationResponse = result;

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _setError('Failed to add location: ${e.toString()}');
      return false;
    }
  }

  // Get address from coordinates
  Future<String?> getAddress(double latitude, double longitude) async {
    try {
      return await _locationService.getAddressFromCoordinates(latitude, longitude);
    } catch (e) {
      _setError('Failed to get address: ${e.toString()}');
      return null;
    }
  }

  // Get coordinates from address
  Future<Map<String, double>?> getCoordinates(String address) async {
    try {
      return await _locationService.getCoordinatesFromAddress(address);
    } catch (e) {
      _setError('Failed to get coordinates: ${e.toString()}');
      return null;
    }
  }

  // Calculate distance
  double? calculateDistance(double endLatitude, double endLongitude) {
    if (_currentPosition == null) return null;
    
    return _locationService.calculateDistance(
      _currentPosition!.latitude,
      _currentPosition!.longitude,
      endLatitude,
      endLongitude,
    );
  }

  Stream<Position>? getPositionStream() {
    try {
      return _locationService.getPositionStream();
    } catch (e) {
      _setError('Failed to start location tracking: ${e.toString()}');
      return null;
    }
  }

  void reset() {
    _isLoading = false;
    _errorMessage = null;
    _currentPosition = null;
    _currentAddress = null;
    _locationResponse = null;
    notifyListeners();
  }
}