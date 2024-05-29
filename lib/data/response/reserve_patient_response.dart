class ReserveResponse {
  final String message;
  final int status;

  ReserveResponse({
    required this.message,
    required this.status,
  });

  factory ReserveResponse.fromJson(Map<String, dynamic> json) {
    return ReserveResponse(
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
