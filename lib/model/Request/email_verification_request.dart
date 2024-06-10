class EmailVerificationRequest {
  final String code;
  final String email;

  EmailVerificationRequest({
    required this.code,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'email': email,
    };
  }
}
