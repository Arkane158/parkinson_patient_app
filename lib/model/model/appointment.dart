class Slots {
  final String time;
  final bool available;

  Slots({
    required this.time,
    required this.available,
  });

  factory Slots.fromJson(Map<String, dynamic> json) {
    return Slots(
      time: json['time'] ?? '',
      available: json['available'] ?? false,
    );
  }
}
