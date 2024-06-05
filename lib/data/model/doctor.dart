class DoctorData {
  final String img;
  final String userId;
  final String phone;
  final String name;
  final String address;
  final List<String> workdays;
  final String startTime;
  final String endTime;

  DoctorData({
    required this.img,
    required this.userId,
    required this.phone,
    required this.name,
    required this.address,
    required this.workdays,
    required this.startTime,
    required this.endTime,
  });

  factory DoctorData.fromJson(Map<String, dynamic> json) {
    return DoctorData(
      img: json['img'] ?? 'null',
      userId: json['userId'] ?? 'null',
      phone: json['phone'] ?? 'null',
      name: json['Name'] ?? 'null',
      address: json['address'] ?? 'null',
      workdays: List<String>.from(json['workdays']),
      startTime: json['startTime'] ?? 'null',
      endTime: json['endTime'] ?? 'null',
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
    };
  }
}
