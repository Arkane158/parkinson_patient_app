import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/data/api_manager.dart';

class SignUpViewModel extends Cubit<SignUpState> {
  SignUpViewModel() : super(LoadingState());

  void signUp(
    File image,
    String password,
    String email,
    String gender,
    String name,
    String phone,
  ) async {
    try {
      emit(LoadingState());
      var response = await ApiManager.signup(
          password: password.trim(),
          email: email.trim(),
          name: name,
          gender: gender,
          phone: phone,
          image: image);
      emit(HideLoadingState());

      if (response.status == 200) {
        emit(SuccessState("Succsse"));
      }
      if (response.status == 404) {
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

abstract class SignUpState {}

class LoadingState extends SignUpState {}

class ErrorState extends SignUpState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends SignUpState {
  String message;
  SuccessState(this.message);
}

class HideLoadingState extends SignUpState {}
