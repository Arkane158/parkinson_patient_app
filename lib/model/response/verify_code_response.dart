class VerifyCodeResponse {
  final String message;
  final int status;

  VerifyCodeResponse({required this.message, required this.status});

  factory VerifyCodeResponse.fromJson(Map<String, dynamic> json) {
    return VerifyCodeResponse(
      message: json['message'],
      status: json['status'],
    );
  }
}
