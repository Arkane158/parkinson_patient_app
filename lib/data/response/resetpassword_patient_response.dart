class ResetPasswordResponse {
  final String message;
  final int status;

  ResetPasswordResponse({
    required this.message,
    required this.status,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponse(
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
    };
  }
}
