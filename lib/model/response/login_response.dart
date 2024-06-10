import 'package:parkinson_app/model/model/patient.dart';

class LoginResponse {
  final String message;
  final int status;
  final Patient? data;
  String img;

  LoginResponse({
    required this.message,
    required this.status,
    required this.img,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        message: json['message'] ?? '',
        status: json['status'] ?? 0,
        data: json['data'] != null ? Patient.fromJson(json['data']) : null,
        img: json['link'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
      'link': img,
      'data': data?.toJson(),
    };
  }
}
