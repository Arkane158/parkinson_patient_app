class Patient {
  final String img;
  final String gender;
  final String phone;
  final String username;
  final String password;
  final String email;
  final String verified;

  Patient({
    required this.img,
    required this.gender,
    required this.phone,
    required this.username,
    required this.password,
    required this.email,
    required this.verified,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      img: json['img'] ?? '',
      gender: json['gender'] ?? '',
      phone: json['phone'] ?? '',
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      email: json['Email'] ?? '',
      verified: json['verified'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'img': img,
      'gender': gender,
      'phone': phone,
      'username': username,
      'password': password,
      'Email': email,
      'verified': verified,
    };
  }
}
