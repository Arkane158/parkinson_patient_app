class Appointment {
  final String name;
  final String doctorId;
  final String dayOfWeek;
  final String patientId;
  final String timeOfDay;
  final String dayOfMonth;
  final String month;
  final String year;
  final String img;

  Appointment({
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

  // Factory constructor for creating a new Appointment instance from a map
  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      name: json['name'],
      doctorId: json['doctorId'],
      dayOfWeek: json['dayOfWeek'],
      patientId: json['patientId'],
      timeOfDay: json['TimeOfDay'],
      dayOfMonth: json['dayOfMonth'],
      month: json['month'],
      year: json['Year'],
      img: json['img'],
    );
  }

  // Method to convert an Appointment instance into a map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'doctorId': doctorId,
      'dayOfWeek': dayOfWeek,
      'patientId': patientId,
      'TimeOfDay': timeOfDay,
      'dayOfMonth': dayOfMonth,
      'month': month,
      'Year': year,
      'img': img,
    };
  }
}
