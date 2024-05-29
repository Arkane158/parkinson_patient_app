class FindAppointmentRequest {
  final String param;
  final String userId;

  FindAppointmentRequest({
    required this.param,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'param': param,
      'userId': userId,
    };
  }
}
