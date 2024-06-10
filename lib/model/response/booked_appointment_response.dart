import 'package:parkinson_app/model/model/appointment_result.dart';

class BookedAppointmentResponse {
  final List<AppointmentResult> result;
  final int status;

  BookedAppointmentResponse({
    required this.result,
    required this.status,
  });

  factory BookedAppointmentResponse.fromJson(Map<String, dynamic> json) {
    return BookedAppointmentResponse(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => AppointmentResult.fromJson(e))
          .toList() ?? [],
      status: json['status'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'result': result.map((e) => e.toJson()).toList(),
      'status': status,
    };
  }
}
