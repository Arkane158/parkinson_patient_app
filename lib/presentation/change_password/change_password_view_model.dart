import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/model/api_manager.dart';

class ChangePasswordViewModel extends Cubit<ChangePasswordState> {
  ChangePasswordViewModel() : super(LoadingState());
  void resetPassword(String email, String password) async {
    try {
      emit(LoadingState());

      var response = await ApiManager.resetPasword(email, password);

      if (response.status == 200) {
        emit(HideLoadingState());
        emit(SuccessState("password Reset Successfully"));
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

abstract class ChangePasswordState {}

class LoadingState extends ChangePasswordState {}

class ErrorState extends ChangePasswordState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends ChangePasswordState {
  String message;
  SuccessState(this.message);
}

class HideLoadingState extends ChangePasswordState {}
