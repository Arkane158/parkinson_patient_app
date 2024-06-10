class TimeSlot {
  final String? time;

  TimeSlot({
    this.time,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      time: json['time'],
    );
  }
}
