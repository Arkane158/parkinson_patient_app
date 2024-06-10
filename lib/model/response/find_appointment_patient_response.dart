import 'package:parkinson_app/model/model/appointment_result.dart';

class FindAppointmentResponse {
  final List<AppointmentResult> result;

  FindAppointmentResponse({
    required this.result,
  });

  factory FindAppointmentResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> resultJson = json['result'] ?? [];
    final result = resultJson
        .map((e) => AppointmentResult.fromJson(e))
        .toList()
        .cast<AppointmentResult>();
    return FindAppointmentResponse(result: result);
  }
}

