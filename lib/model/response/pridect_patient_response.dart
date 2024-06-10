class PredictResponse {
  final int status;
  final String score;
  final String message;

  PredictResponse({
    required this.status,
    required this.score,
    required this.message,
  });

  factory PredictResponse.fromJson(Map<String, dynamic> json) {
    return PredictResponse(
      status: json['status'] ?? 0,
      score: json['score'] ?? '',
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'score': score,
      'message': message,
    };
  }
}
