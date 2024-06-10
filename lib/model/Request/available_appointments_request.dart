class AvailableAppointmentsRequest {
  final String dayOfMonth;
  final String month;
  final String userId;
  final String year;

  AvailableAppointmentsRequest({
    required this.dayOfMonth,
    required this.month,
    required this.userId,
    required this.year,
  });
 
  Map<String, dynamic> toJson() {
    return {
      'dayOfMonth': dayOfMonth,
      'month': month,
      'userId': userId,
      'Year': year,
    };
  }
}
