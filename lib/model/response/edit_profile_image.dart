class NewProfileImageResponse {
  final String message;
  final String link;
  final int status;

  NewProfileImageResponse({
    required this.message,
    required this.link,
    required this.status,
  });

  factory NewProfileImageResponse.fromJson(Map<String, dynamic> json) {
    return NewProfileImageResponse(
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
