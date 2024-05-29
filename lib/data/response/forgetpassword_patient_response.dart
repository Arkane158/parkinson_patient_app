class ForgetPasswordResponse {
  final String message;
  final int status;

  ForgetPasswordResponse({required this.message, required this.status});

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResponse(
      message: json['message'],
      status: json['status'],
    );
  }
}