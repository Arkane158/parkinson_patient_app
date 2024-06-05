import 'package:shared_preferences/shared_preferences.dart';

class UserPref {
  static const String _keyId = 'id';
  static const String _keyEmail = 'email';
  static const String _keyPhone = 'phone';
  static const String _keyName = 'name';
  static const String _keyImg = 'img';
  static const String _keyGender = 'gender';
  static const String _keyVerified = 'verified';
  static const String _keyVersion = 'version';

  // Save user data
  static Future<void> saveUserData({
    required String id,
    required String email,
    required String phone,
    required String name,
    required String img,
    required String gender,
    required bool verified,
    required int version,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyId, id);
    await prefs.setString(_keyEmail, email);
    await prefs.setString(_keyPhone, phone);
    await prefs.setString(_keyName, name);
    await prefs.setString(_keyImg, img);
    await prefs.setString(_keyGender, gender);
    await prefs.setBool(_keyVerified, verified);
    await prefs.setInt(_keyVersion, version);
  }

  // Save individual attributes
  static Future<void> saveUserId({required String id}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyId, id);
  }

  static Future<void> saveUserEmail({required String email}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyEmail, email);
  }

  static Future<void> saveUserPhone({required String phone}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyPhone, phone);
  }

  static Future<void> saveUserName({required String name}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyName, name);
  }

  static Future<void> saveUserImg({required String img}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyImg, img);
  }

  static Future<void> saveUserGender({required String gender}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyGender, gender);
  }

  static Future<void> saveUserVerified({required bool verified}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyVerified, verified);
  }

  static Future<void> saveUserVersion({required int version}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyVersion, version);
  }

  // Get individual attributes
  static Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyId);
  }

  static Future<String?> getUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyEmail);
  }

  static Future<String?> getUserPhone() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyPhone);
  }

  static Future<String?> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyName);
  }

  static Future<String?> getUserImg() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyImg);
  }

  static Future<String?> getUserGender() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyGender);
  }

  static Future<bool?> getUserVerified() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyVerified);
  }

  static Future<int?> getUserVersion() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyVersion);
  }

  // Clear all user data
  static Future<void> clearUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyId);
    await prefs.remove(_keyEmail);
    await prefs.remove(_keyPhone);
    await prefs.remove(_keyName);
    await prefs.remove(_keyImg);
    await prefs.remove(_keyGender);
    await prefs.remove(_keyVerified);
    await prefs.remove(_keyVersion);
  }
}
