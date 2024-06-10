import 'package:parkinson_app/model/model/appointment.dart';

class AvailableAppointmentsResponse {
  final List<Slots>? result;
  final String message;
  final int status;
  final String appointmentId; // Include appointmentId field

  AvailableAppointmentsResponse({
    this.result,
    required this.message,
    required this.status,
    required this.appointmentId, // Add appointmentId to constructor
  });

  factory AvailableAppointmentsResponse.fromJson(Map<String, dynamic> json) {
    return AvailableAppointmentsResponse(
      result: json['slots'] != null
          ? List<Slots>.from(json['slots'].map((slot) => Slots.fromJson(slot)))
          : null,
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
      appointmentId: json['appointmentId'] ?? '', // Assign appointmentId from JSON
    );
  }
}
