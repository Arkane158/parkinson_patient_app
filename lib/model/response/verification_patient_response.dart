class EmailVerificationResponse {
  final String message;
  final int status;

  EmailVerificationResponse({
    required this.message,
    required this.status,
  });

  factory EmailVerificationResponse.fromJson(Map<String, dynamic> json) {
    return EmailVerificationResponse(
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
