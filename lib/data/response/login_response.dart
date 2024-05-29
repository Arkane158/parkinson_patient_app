import 'package:parkinson_app/data/model/patient.dart';

class LoginResponse {
  final String message;
  final int status;
  final Patient? data;

  LoginResponse({
    required this.message,
    required this.status,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
      data: json['data'] != null ? Patient.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
      'data': data?.toJson(),
    };
  }
  
}
