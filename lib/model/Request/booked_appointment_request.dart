class BookedAppointmentRequest {
  final String userId;

  BookedAppointmentRequest({
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
    };
  }
}