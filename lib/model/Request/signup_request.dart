import 'dart:io';

class SignupRequest {
  final String password;
  final String email;
  final String name;
  final String gender;
  final String phone;
  final File image; // Assuming you want to store the image file path or URL

  SignupRequest({
    required this.password,
    required this.email,
    required this.name,
    required this.gender,
    required this.phone,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'email': email,
      'name': name,
      'gender': gender,
      'phone': phone,
      'image': image,
    };
  }
}
