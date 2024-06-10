class ReserveAppointmentRequest {
  final String doctorName;
  final String patientName;
  final String doctorId;
  final String patientId;
  final String dayOfWeek;
  final String timeOfDay;
  final String dayOfMonth;
  final String month;
  final String year;
  final String link;
  final String doctorLink;
  final String appointmentId; // Include appointmentId field

  ReserveAppointmentRequest({
    required this.doctorName,
    required this.patientName,
    required this.doctorId,
    required this.dayOfWeek,
    required this.patientId,
    required this.timeOfDay,
    required this.dayOfMonth,
    required this.month,
    required this.year,
    required this.link,
    required this.doctorLink,
    required this.appointmentId, // Add appointmentId to constructor
  });

  Map<String, dynamic> toJson() {
    
    return {
      'doctorName': doctorName,
      'patientName': patientName,
      'doctorId': doctorId,
      'dayOfWeek': dayOfWeek,
      'patientId': patientId,
      'TimeOfDay': timeOfDay,
      'dayOfMonth': dayOfMonth,
      'month': month,
      'Year': year,
      'link': link,
      'doctorlink': doctorLink,
      'appointmentId': appointmentId, // Include appointmentId in JSON
    };
  }
}
