import 'dart:convert';
import 'dart:io';

import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:parkinson_app/model/Request/available_appointments_request.dart';
import 'package:parkinson_app/model/Request/booked_appointment_request.dart';
import 'package:parkinson_app/model/Request/cancel_request.dart';
import 'package:parkinson_app/model/Request/edit_profile_request.dart';
import 'package:parkinson_app/model/Request/email_verification_request.dart';
import 'package:parkinson_app/model/Request/forget_password_request.dart';
import 'package:parkinson_app/model/Request/login_request.dart';
import 'package:parkinson_app/model/Request/reserve_request.dart';
import 'package:parkinson_app/model/Request/reset_password_request.dart';
import 'package:parkinson_app/model/Request/verify_code_request.dart';
import 'package:parkinson_app/model/response/availableappointments_patient_response.dart';
import 'package:parkinson_app/model/response/booked_appointment_response.dart';
import 'package:parkinson_app/model/response/cancel_appointment_response.dart';
import 'package:parkinson_app/model/response/doctor_list_response.dart';
import 'package:parkinson_app/model/response/edit_profile_image.dart';
import 'package:parkinson_app/model/response/edit_profile_response.dart';
import 'package:parkinson_app/model/response/forgetpassword_patient_response.dart';
import 'package:parkinson_app/model/response/login_response.dart';
import 'package:parkinson_app/model/response/reserve_patient_response.dart';
import 'package:parkinson_app/model/response/resetpassword_patient_response.dart';
import 'package:parkinson_app/model/response/signup_response.dart';
import 'package:parkinson_app/model/response/verification_patient_response.dart';
import 'package:parkinson_app/model/response/verify_code_response.dart';

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
  static const String editProfileUrl = '/edit-profile';
  static const String editProfileImgUrl = '/new-profileImage';
  static const String appointmentsUrl = '/apoinmments';
  static const String cancelAppointmentUrl = '/cancel-apoinmment';

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

  static Future<DoctorResponse> doctorList() async {
    var url =
        Uri.parse('https://parkinson-9ek4.onrender.com/patient$doctorListUrl');
    var response = await http.post(url);
    // print(response.body);
    return DoctorResponse.fromJson(jsonDecode(response.body));
  }

  static Future<EditProfileResponse> editProfile(
      {required String phone,
      required String name,
      required String email,
      required String userId}) async {
    var url =
        Uri.parse('https://parkinson-9ek4.onrender.com/patient$editProfileUrl');
    var requestBody = EditProfileRequest(
        phone: phone, name: name, email: email, userId: userId);
    var response = await http.post(url, body: requestBody.toJson());
    return EditProfileResponse.fromJson(jsonDecode(response.body));
  }

  static Future<NewProfileImageResponse> editProfileImg(
      File img, String userId) async {
    var url = Uri.parse(
        'https://parkinson-9ek4.onrender.com/patient$editProfileImgUrl');

    try {
      // Create a MultipartRequest
      var request = http.MultipartRequest('POST', url);

      // Add the image file to the request
      var stream = http.ByteStream(img.openRead());
      var length = await img.length();
      var multipartFile = http.MultipartFile(
        'image',
        stream,
        length,
        filename: 'profile_image.jpg',
        contentType: MediaType('image', 'jpeg'), // Specify content type here
      );
      request.files.add(multipartFile);
      // Add userId to the request fields
      request.fields['userId'] = userId;

      // Send the reques
      var response = await request.send();

      // Handle the response
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseData);

        return NewProfileImageResponse.fromJson(jsonResponse);
      } else if (response.statusCode == 404) {
        var responseData = await response.stream.bytesToString();
        throw Exception(responseData);
      } else {
        throw Exception('Failed to upload image: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }

  static Future<AvailableAppointmentsResponse> availableAppointments(
      {required String dayOfMonth,
      required String month,
      required String year,
      required String userId}) async {
    var url = Uri.parse(
        'https://parkinson-9ek4.onrender.com/patient$availableAppointmentUrl');
    var requestBody = AvailableAppointmentsRequest(
        dayOfMonth: dayOfMonth, month: month, userId: userId, year: year);
    var response = await http.post(url, body: requestBody.toJson());
    return AvailableAppointmentsResponse.fromJson(jsonDecode(response.body));
  }

  static Future<ReserveAppointmentResponse> reserveAppointment(
      {required String doctorName,
      required String patientName,
      required String doctorId,
      required String patientId,
      required String timeOfDay,
      required String dayOfMonth,
      required String month,
      required String year,
      required String doctorImg,
      required String patientImg,
      required String appointmentId,
      required String dayOfWeek}) async {
    var url =
        Uri.parse('https://parkinson-9ek4.onrender.com/patient$reserveUrl');
    var requestBody = ReserveAppointmentRequest(
        appointmentId: appointmentId,
        doctorId: doctorId,
        dayOfWeek: dayOfWeek,
        patientId: patientId,
        patientName: patientName,
        timeOfDay: timeOfDay,
        dayOfMonth: dayOfMonth,
        month: month,
        year: year,
        doctorName: doctorName,
        link: patientImg,
        doctorLink: doctorImg);
    var response = await http.post(url, body: requestBody.toJson());
    return ReserveAppointmentResponse.fromJson(jsonDecode(response.body));
  }

  static Future<BookedAppointmentResponse> bookedAppointments(
      {required String userId}) async {
    var requestBody = BookedAppointmentRequest(userId: userId);
    var url = Uri.parse(
        'https://parkinson-9ek4.onrender.com/patient$appointmentsUrl');
    var response = await http.post(url, body: requestBody.toJson());
    print(response.body);

    return BookedAppointmentResponse.fromJson(jsonDecode(response.body));
  }

  static Future<CancelAppointmentResponse> cancelAppointments(
      {required String appointmentId,
      required String reserveId,
      required String timeOfDay}) async {
    var url = Uri.parse(
        'https://parkinson-9ek4.onrender.com/patient$cancelAppointmentUrl');
    var requestBody = CancelAppointmentRequest(
        timeOfDay: timeOfDay,
        reservationId: reserveId,
        appointmentId: appointmentId);
    var response = await http.post(url, body: requestBody.toJson());
    return CancelAppointmentResponse.fromJson(jsonDecode(response.body));
  }
}
