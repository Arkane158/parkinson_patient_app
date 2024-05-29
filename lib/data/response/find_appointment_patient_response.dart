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

class AppointmentResult {
  final String doctorId;
  final String patientId;
  final String dayOfWeek;
  final String dayOfMonth;
  final String timeOfDay;
  final String month;
  final String year;
  final String name;
  final String img;
  final int status;

  AppointmentResult({
    required this.doctorId,
    required this.patientId,
    required this.dayOfWeek,
    required this.dayOfMonth,
    required this.timeOfDay,
    required this.month,
    required this.year,
    required this.name,
    required this.img,
    required this.status,
  });

  factory AppointmentResult.fromJson(Map<String, dynamic> json) {
    return AppointmentResult(
      doctorId: json['doctorId'] ?? '',
      patientId: json['patientId'] ?? '',
      dayOfWeek: json['dayOfWeek'] ?? '',
      dayOfMonth: json['dayOfMonth'] ?? '',
      timeOfDay: json['TimeOfDay'] ?? '',
      month: json['month'] ?? '',
      year: json['Year'] ?? '',
      name: json['name'] ?? '',
      img: json['img'] ?? '',
      status: json['status'] ?? 0,
    );
  }
}
