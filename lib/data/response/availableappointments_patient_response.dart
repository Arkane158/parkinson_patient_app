class AvailableAppointmentsResponse {
  final List<AppointmentData> appointments;

  AvailableAppointmentsResponse({
    required this.appointments,
  });

  factory AvailableAppointmentsResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> appointmentsJson = json['appointments'] ?? [];
    final appointments = appointmentsJson
        .map((e) => AppointmentData.fromJson(e))
        .toList()
        .cast<AppointmentData>();
    return AvailableAppointmentsResponse(appointments: appointments);
  }
}

class AppointmentData {
  final String userId;
  final String dayOfWeek;
  final String dayOfMonth;
  final String month;
  final String year;
  final List<TimeSlot> timeSlots;

  AppointmentData({
    required this.userId,
    required this.dayOfWeek,
    required this.dayOfMonth,
    required this.month,
    required this.year,
    required this.timeSlots,
  });

  factory AppointmentData.fromJson(Map<String, dynamic> json) {
    final List<dynamic> timeSlotsJson = json['timeSlots'] ?? [];
    final timeSlots = timeSlotsJson
        .map((e) => TimeSlot.fromJson(e))
        .toList()
        .cast<TimeSlot>();
    return AppointmentData(
      userId: json['userId'] ?? '',
      dayOfWeek: json['dayOfWeek'] ?? '',
      dayOfMonth: json['dayOfMonth'] ?? '',
      month: json['month'] ?? '',
      year: json['Year'] ?? '',
      timeSlots: timeSlots,
    );
  }
}

class TimeSlot {
  final String time;
  final bool available;

  TimeSlot({
    required this.time,
    required this.available,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      time: json['time'] ?? '',
      available: json['available'] ?? false,
    );
  }
}
