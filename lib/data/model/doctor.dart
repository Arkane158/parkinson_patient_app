class DoctorData {
  final String img;
  final String userId;
  final String phone;
  final String name;
  final String address;
  final List<String> workdays;
  final String startTime;
  final String endTime;
  final String step;

  DoctorData({
    required this.img,
    required this.userId,
    required this.phone,
    required this.name,
    required this.address,
    required this.workdays,
    required this.startTime,
    required this.endTime,
    required this.step,
  });

  factory DoctorData.fromJson(Map<String, dynamic> json) {
    return DoctorData(
      img: json['img'],
      userId: json['userId'],
      phone: json['phone'],
      name: json['Name'],
      address: json['address'],
      workdays: List<String>.from(json['workdays']),
      startTime: json['startTime'],
      endTime: json['endTime'],
      step: json['step'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'img': img,
      'userId': userId,
      'phone': phone,
      'Name': name,
      'address': address,
      'workdays': workdays,
      'startTime': startTime,
      'endTime': endTime,
      'step': step,
    };
  }
}
