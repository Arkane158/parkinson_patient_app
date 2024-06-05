import 'dart:convert';
import 'dart:io';

import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:parkinson_app/data/Request/available_appointments_request.dart';
import 'package:parkinson_app/data/Request/email_verification_request.dart';
import 'package:parkinson_app/data/Request/forget_password_request.dart';
import 'package:parkinson_app/data/Request/login_request.dart';
import 'package:parkinson_app/data/Request/reserve_request.dart';
import 'package:parkinson_app/data/Request/reset_password_request.dart';
import 'package:parkinson_app/data/Request/verify_code_request.dart';
import 'package:parkinson_app/data/response/availableappointments_patient_response.dart';
import 'package:parkinson_app/data/response/doctor_list_response.dart';
import 'package:parkinson_app/data/response/forgetpassword_patient_response.dart';
import 'package:parkinson_app/data/response/login_response.dart';
import 'package:parkinson_app/data/response/reserve_patient_response.dart';
import 'package:parkinson_app/data/response/resetpassword_patient_response.dart';
import 'package:parkinson_app/data/response/signup_response.dart';
import 'package:parkinson_app/data/response/verification_patient_response.dart';
import 'package:parkinson_app/data/response/verify_code_response.dart';

class ApiManager {
  static const String baseUrl = 'parkinson-9ek4.onrender.com/patient';
  static const String signUp = '/Signup';
  static const String loginUrl = '/login';
  static const String emailVerificationUrl = '/emailverification';
  static const String forgotPasswordUrl = '/forget-password';
  static const String verifyCodeUrl = '/Verify-code';
  static const String resetPasswordUrl = '/reset-password';
  static const String reserveUrl = '/reserve';
  static const String doctorListUrl = '/doctors-list';
  static const String availableAppointmentUrl = '/avalible-apoinmments';

  static Future<SignUpResponse> signup({
    required String password,
    required String email,
    required String name,
    required String gender,
    required String phone,
    required File image,
  }) async {
    try {
      // Construct the query string
      String queryString = Uri(
        queryParameters: {
          'password': password,
          'email': email,
          'name': name,
          'gender': gender,
          'phone': phone,
        },
      ).query;

      // Construct the URI with the query string
      var uri = Uri.parse(
          'https://parkinson-9ek4.onrender.com/patient$signUp?$queryString');

      var request = http.MultipartRequest('POST', uri);

      var stream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile(
        'image',
        stream,
        length,

        filename: 'profile_image.jpg',
        contentType: MediaType('image', 'jpeg'), // Specify content type here
      );
      request.files.add(multipartFile);

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseData);

        return SignUpResponse.fromJson(jsonResponse);
      } else if (response.statusCode == 404) {
        var responseData = await response.stream.bytesToString();
        throw Exception(responseData);
      } else {
        throw Exception('Failed to signup: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to signup: $e');
    }
  }

  static Future<LoginResponse> login(String email, String password) async {
    var url = Uri.parse('https://parkinson-9ek4.onrender.com/patient$loginUrl');
    var requestBody = LoginRequest(email: email, password: password);

    var response = await http.post(url, body: requestBody.toJson());
    return LoginResponse.fromJson(jsonDecode(response.body));
  }

  static Future<EmailVerificationResponse> emailVerification(
      String email, String code) async {
    var url = Uri.parse(
        'https://parkinson-9ek4.onrender.com/patient/emailverification');
    var requestBody = EmailVerificationRequest(code: code, email: email);
    var response = await http.post(url, body: requestBody.toJson());
    return EmailVerificationResponse.fromJson(jsonDecode(response.body));
  }

  static Future<ForgetPasswordResponse> forgotPassword(
      {required String email}) async {
    var url = Uri.parse(
        'https://parkinson-9ek4.onrender.com/patient$forgotPasswordUrl');
    var requestBody = ForgetPasswordRequest(email: email);
    var response = await http.post(url, body: requestBody.toJson());
    return ForgetPasswordResponse.fromJson(jsonDecode(response.body));
  }

  static Future<VerifyCodeResponse> verifyCode(
      String email, String code) async {
    var url =
        Uri.parse('https://parkinson-9ek4.onrender.com/patient$verifyCodeUrl');
    var requestBody = VerifyCodeRequest(email: email, code: code);
    var response = await http.post(url, body: requestBody.toJson());
    return VerifyCodeResponse.fromJson(jsonDecode(response.body));
  }

  static Future<ResetPasswordResponse> resetPasword(
      String email, String newPassword) async {
    var url = Uri.parse(
        'https://parkinson-9ek4.onrender.com/patient$resetPasswordUrl');
    var requestBody =
        ResetPasswordRequest(email: email, newPassword: newPassword);
    var response = await http.post(url, body: requestBody.toJson());
    return ResetPasswordResponse.fromJson(jsonDecode(response.body));
  }

  static Future<ReserveResponse> reserveResponse(
      {required String name,
      required String doctorId,
      required String dayOfWeek,
      required String patientId,
      required String timeOfDay,
      required String dayOfMonth,
      required String month,
      required String year,
      required String img}) async {
    var url = Uri.https(baseUrl, reserveUrl);
    var requestBoy = ReserveRequest(
        name: name,
        doctorId: doctorId,
        dayOfWeek: dayOfWeek,
        patientId: patientId,
        timeOfDay: timeOfDay,
        dayOfMonth: dayOfMonth,
        month: month,
        year: year,
        img: img);
    var response = await http.post(url, body: requestBoy);
    return ReserveResponse.fromJson(jsonDecode(response.body));
  }

  static Future<DoctorResponse> doctorList() async {
    var url =
        Uri.parse('https://parkinson-9ek4.onrender.com/patient$doctorListUrl');
    var response = await http.post(url);
    // print(response.body);
    return DoctorResponse.fromJson(jsonDecode(response.body));
  }

  static Future<AvailableAppointmentsResponse> availableAppointments(
      {required String userId}) async {
    var url = Uri.https(baseUrl, availableAppointmentUrl);
    var requestBody = AvailableAppointmentsRequest(doctorId: userId);
    var response = await http.post(url, body: requestBody.toJson());
    return AvailableAppointmentsResponse.fromJson(jsonDecode(response.body));
  }
}
