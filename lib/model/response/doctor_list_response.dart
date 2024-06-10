import 'package:parkinson_app/model/model/doctor.dart';

class DoctorResponse {
  final List<DoctorData> data;
  final int status;

  DoctorResponse({
    required this.data,
    required this.status,
  });

  factory DoctorResponse.fromJson(Map<String, dynamic> json) {
    return DoctorResponse(
      data: (json['data'] as List)
          .map((doctorData) => DoctorData.fromJson(doctorData))
          .toList(),
      status: json['status'],
    );
  }
}
