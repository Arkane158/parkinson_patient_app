class EditProfileRequest {
  final String phone;
  final String name;
  final String email;
  final String userId;

  EditProfileRequest({
    required this.phone,
    required this.name,
    required this.email,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'name': name,
      'email': email,
      'userId': userId,
    };
  }
}
