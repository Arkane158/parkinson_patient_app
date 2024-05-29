class AvailableAppointmentsRequest {
  final String doctorId;

  AvailableAppointmentsRequest({
    required this.doctorId,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': doctorId,
    };
  }
}
