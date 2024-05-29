import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/data/api_manager.dart';

class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel() : super(LoadingState());
  void login(String email, String password) async {
    try {
      emit(LoadingState());

      var response = await ApiManager.login(email, password);

      if (response.status == 200) {
        emit(HideLoadingState());

        // if (response.doctor?.phone != null) {
        //   var doctor = response.doctor;
        //   await DoctorPreference.saveUserName(name: doctor!.name!);
        //   await DoctorPreference.saveUserPhone(phone: doctor.phone!);
        //   await DoctorPreference.saveUserEmail(email: email);
        //   await DoctorPreference.saveUserEndTime(endTime: doctor.endTime!);
        //   await DoctorPreference.saveUserStartTime(
        //       startTime: doctor.startTime!);
        //   await DoctorPreference.saveUserWorkdays(
        //       workdays: doctor.workdays.toString());
        //   await DoctorPreference.saveUserAddress(address: doctor.address!);
        //   await DoctorPreference.saveUserStep(step: doctor.step!);
        //   await DoctorPreference.saveUserImg(img: response.doctor!.img!);
        //   await DoctorPreference.saveProfileId(
        //       profileId: response.doctor!.profileId!);
        // }

        // await DoctorPreference.saveUserId(id: response.userId);

        emit(SuccessState("Login Successfully"));
      }
      if (response.status != 200) {
        emit(HideLoadingState());

        emit(ErrorState(response.message));
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

abstract class LoginState {}

class LoadingState extends LoginState {}

class ErrorState extends LoginState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends LoginState {
  String message;
  
  SuccessState(this.message);
}

class HideLoadingState extends LoginState {}
