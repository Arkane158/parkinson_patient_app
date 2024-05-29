class ReserveRequest {
  final String name;
  final String doctorId;
  final String dayOfWeek;
  final String patientId;
  final String timeOfDay;
  final String dayOfMonth;
  final String month;
  final String year;
  final String img;

  ReserveRequest({
    required this.name,
    required this.doctorId,
    required this.dayOfWeek,
    required this.patientId,
    required this.timeOfDay,
    required this.dayOfMonth,
    required this.month,
    required this.year,
    required this.img,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'doctorId': doctorId,
      'dayOfWeek': dayOfWeek,
      'patientId': patientId,
      'timeOfDay': timeOfDay,
      'dayOfMonth': dayOfMonth,
      'month': month,
      'year': year,
      'img': img,
    };
  }
}
