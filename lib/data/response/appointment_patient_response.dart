class AppointmentResponse {
  final List<AppointmentResult> result;
  final int status;

  AppointmentResponse({
    required this.result,
    required this.status,
  });

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) {
    return AppointmentResponse(
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
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctorId': doctorId,
      'patientId': patientId,
      'dayOfWeek': dayOfWeek,
      'dayOfMonth': dayOfMonth,
      'TimeOfDay': timeOfDay,
      'month': month,
      'Year': year,
      'name': name,
      'img': img,
    };
  }
}
