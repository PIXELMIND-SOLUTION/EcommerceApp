import 'dart:convert';
import 'package:ecommerce_app/constants/api_constant.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  // Check if location services are enabled
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  // Check and request location permissions
  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception(
        'Location services are disabled. Please enable location services.',
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
        'Location permissions are permanently denied, we cannot request permissions. Please enable from settings.',
      );
    }

    return true;
  }

  // Get current position
  Future<Position> getCurrentPosition() async {
    await handleLocationPermission();

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<String> getAddressFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        return '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      }
      return 'Address not found';
    } catch (e) {
      print('Error getting address: $e');
      return 'Unable to get address';
    }
  }

  Future<Map<String, double>?> getCoordinatesFromAddress(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);

      if (locations.isNotEmpty) {
        return {
          'latitude': locations[0].latitude,
          'longitude': locations[0].longitude,
        };
      }
      return null;
    } catch (e) {
      print('Error getting coordinates: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>> addLocationToBackend({
    required String userId,
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.addlocation),
        headers: ApiConstants.headers,
        body: json.encode({
          'userId': userId,
          'latitude': latitude,
          'longitude': longitude,
        }),
      );

      print('response status code for add location ${response.statusCode}');
      print('response bodyyyyyyyy for add location ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to add location: ${response.body}');
      }
    } catch (e) {
      print('Error adding location: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addCurrentLocation(String userId) async {
    try {
      Position position = await getCurrentPosition();

      String address = await getAddressFromCoordinates(
        position.latitude,
        position.longitude,
      );

      // Add to backend
      final result = await addLocationToBackend(
        userId: userId,
        latitude: position.latitude,
        longitude: position.longitude,
      );

      return {
        ...result,
        'address': address,
        'latitude': position.latitude,
        'longitude': position.longitude,
      };
    } catch (e) {
      print('Error in addCurrentLocation: $e');
      rethrow;
    }
  }

  double calculateDistance(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) {
    return Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );
  }

  // Stream position updates (for real-time tracking)
  Stream<Position> getPositionStream() {
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10, 
    );

    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }
}
