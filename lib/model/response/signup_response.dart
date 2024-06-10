class SignUpResponse {
  final String message;
  final String? link;
  final int status;

  SignUpResponse({
    required this.message,
    this.link,
    required this.status,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      message: json['message'] ?? '',
      link: json['link'] ?? '',
      status: json['status'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'link': link,
      'status': status,
    };
  }
}
