import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/model/api_manager.dart';
import 'package:parkinson_app/model/model/appointment_result.dart';

class BookedAppoitnmentViewModel extends Cubit<BookedAppoitnmentState> {
  BookedAppoitnmentViewModel() : super(LoadingState());
  List<AppointmentResult> appointments = [];

  void bookedAppointment(String userId) async {
    appointments = [];

    try {
      emit(LoadingState());

      var response = await ApiManager.bookedAppointments(userId: userId);

      if (response.status == 200) {
        appointments = response.result;
        emit(HideLoadingState());
        emit(SuccessState("Appointments Loaded Successfully"));
      } else if (response.status == 404) {
        emit(HideLoadingState());
        emit(ErrorState('Something Went Wrong'));
      }
    } catch (e) {
      emit(HideLoadingState());
      if (e is IOException || e is HttpException) {
        emit(ErrorState('Check Your Internet connection'));
      } else {
        emit(ErrorState(e.toString()));
      }
    }
  }

  void canelAppoitment(
      {required String appointmentId,
      required String reserveId,
      required String timeOfDay}) async {
    try {
      emit(LoadingState());

      var response = await ApiManager.cancelAppointments(
          timeOfDay: timeOfDay,
          appointmentId: appointmentId,
          reserveId: reserveId);

      if (response.status == 200) {
        emit(HideLoadingState());
        emit(SuccessState(response.message));
      } else if (response.status == 404) {
        emit(HideLoadingState());
        emit(ErrorState('Something '));
      }
    } catch (e) {
      emit(HideLoadingState());
      if (e is IOException || e is HttpException) {
        emit(ErrorState('Check Your Internet connection'));
      } else {
        emit(ErrorState(e.toString()));
      }
    }
  }
}

abstract class BookedAppoitnmentState {}

class LoadingState extends BookedAppoitnmentState {}

class ErrorState extends BookedAppoitnmentState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends BookedAppoitnmentState {
  final String message;
  SuccessState(this.message);
}

class HideLoadingState extends BookedAppoitnmentState {}
