import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/model/api_manager.dart';
import 'package:parkinson_app/model/model/appointment.dart';
import 'package:parkinson_app/model/response/availableappointments_patient_response.dart';
import 'package:parkinson_app/pref/user_save_shared_prefrence.dart';

class BookViewModel extends Cubit<BookState> {
  BookViewModel() : super(InitialBookState());
  List<Slots> availableTimeSlots = [];

  Future<void> availableAppointments({
    required String dayOfMonth,
    required String month,
    required String year,
    required String doctorId,
  }) async {
    try {
      emit(LoadingState());

      var response = await ApiManager.availableAppointments(
        dayOfMonth: dayOfMonth,
        month: month,
        year: year,
        userId: doctorId,
      );
      if (response.result != null) {
        availableTimeSlots = response.result!;
      }

      if (response.status == 200) {
        emit(AppointmentsLoadedState(response));
      } else if (response.status == 404) {
        emit(ErrorState('No available appointments found'));
      } else {
        emit(ErrorState('Something went wrong'));
      }
    } catch (e) {
      if (e is IOException || e is HttpException) {
        emit(ErrorState('Check your internet connection'));
      } else {
        emit(ErrorState(e.toString()));
      }
    } finally {
      emit(HideLoadingState());
    }
  }

  Future<void> reserveAppointment({
    required String doctorName,
    required String patientName,
    required String doctorId,
    required String timeOfDay,
    required String dayOfMonth,
    required String month,
    required String year,
    required String doctorImg,
    required String dayOfWeek,
    required String appointmentId,
  }) async {
    emit(LoadingState());

    try {
      var patientId = await UserPref.getUserId();
      var patientImg = await UserPref.getUserImg();

      if (patientId == null || patientImg == null) {
        emit(HideLoadingState());
        emit(ErrorState('Failed to retrieve user information'));
        return;
      }

      var response = await ApiManager.reserveAppointment(
        appointmentId: appointmentId,
        doctorName: doctorName,
        patientName: patientName,
        doctorId: doctorId,
        patientId: patientId,
        timeOfDay: timeOfDay,
        dayOfMonth: dayOfMonth,
        month: month,
        year: year,
        dayOfWeek: dayOfWeek,
        doctorImg: doctorImg,
        patientImg: patientImg,
      );

      if (response.status == 200) {
        emit(HideLoadingState());
        emit(SuccessState("Appointment reserved successfully"));
      } else if (response.status == 404) {
        emit(HideLoadingState());
        emit(ErrorState(response.message));
      } else {
        emit(HideLoadingState());
        emit(ErrorState('Something went wrong'));
      }
    } catch (e) {
      emit(HideLoadingState());

      if (e is IOException || e is HttpException) {
        emit(ErrorState('Check your internet connection'));
      } else {
        emit(ErrorState(e.toString()));
      }
    }
  }
}

// Abstract state class
abstract class BookState {}

class InitialBookState extends BookState {}

class LoadingState extends BookState {}

class HideLoadingState extends BookState {}

class ErrorState extends BookState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends BookState {
  final String message;
  SuccessState(this.message);
}

class AppointmentsLoadedState extends BookState {
  final AvailableAppointmentsResponse response;
  AppointmentsLoadedState(this.response);
}
