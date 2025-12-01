class Location {
  final String type;
  final List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

 factory Location.fromJson(Map<String, dynamic> json) {
    List<double> coords = [];
    if (json['coordinates'] is List) {
      coords = (json['coordinates'] as List)
          .map((e) => e is int ? e.toDouble() : e as double)
          .toList();
    }

    return Location(
      type: json['type'] ?? 'Point',
      coordinates: coords,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'coordinates': coordinates,
    };
  }
}

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String mobile;
  final String?profile;
  final Location location;
  final int? version;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.mobile,
    required this.location,
    this.profile,
    this.version,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      mobile: json['mobile'] ?? '',
      location: Location.fromJson(json['location'] ?? {}),
      version: json['__v'],
      profile: json['profile']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'password': password,
      'mobile': mobile,
      'location': location.toJson(),
      '__v': version,
      'profile':profile
    };
  }
}

class RegisterResponse {
  final bool success;
  final String message;
  final User user;

  RegisterResponse({
    required this.success,
    required this.message,
    required this.user,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      user: User.fromJson(json['user'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'user': user.toJson(),
    };
  }
}