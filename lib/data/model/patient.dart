class Patient {
  final String id;
  final String img;
  final String gender;
  final String phone;
  final String username;
  final String email;
  final bool verified;
  final int version;

  Patient({
    required this.id,
    required this.img,
    required this.gender,
    required this.phone,
    required this.username,
    required this.email,
    required this.verified,
    required this.version,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['_id'] ?? '',
      img: json['link'] ?? '',
      gender: json['gender'] ?? '',
      phone: json['phone'] ?? '',
      username: json['username'] ?? '',
      email: json['Email'] ?? '',
      verified: json['verified'] ?? false,
      version: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'link': img,
      'gender': gender,
      'phone': phone,
      'username': username,
      'Email': email,
      'verified': verified,
      '__v': version,
    };
  }
}
