import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/model/api_manager.dart';
import 'package:parkinson_app/pref/user_save_shared_prefrence.dart';

class EditAccountViewModel extends Cubit<EditAccountState> {
  EditAccountViewModel() : super(LoadingState());

  void editProfileImage(File file) async {
    try {
      emit(LoadingState());
      String? userId = await UserPref.getUserId();
      var response = await ApiManager.editProfileImg(file,userId!);
      if (response.status == 200) {
        emit(HideLoadingState());

        UserPref.saveUserImg(img: response.link);
        emit(SuccessState(response.message.toString()));
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

  void editProfile({
    required String phone,
    required String name,
  }) async {
    try {
      emit(LoadingState());
      String? userId = await UserPref.getUserId();
      String? email = await UserPref.getUserEmail();
      var response = await ApiManager.editProfile(
          phone: phone, name: name, email: email!, userId: userId!);
      await UserPref.saveUserName(name: name);
      await UserPref.saveUserPhone(phone: phone);

      if (response.status == 200) {
        emit(HideLoadingState());

        emit(SuccessState(response.message.toString()));
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

abstract class EditAccountState {}

class LoadingState extends EditAccountState {}

class ErrorState extends EditAccountState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends EditAccountState {
  String message;
  SuccessState(this.message);
}

class HideLoadingState extends EditAccountState {}
