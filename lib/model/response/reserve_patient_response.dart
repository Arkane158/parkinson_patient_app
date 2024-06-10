class ReserveAppointmentResponse {
  final String message;
  final int status;

  ReserveAppointmentResponse({
    required this.message,
    required this.status,
  });

  factory ReserveAppointmentResponse.fromJson(Map<String, dynamic> json) {
    return ReserveAppointmentResponse(
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
