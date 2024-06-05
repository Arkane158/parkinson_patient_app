// HomeViewModel
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/data/api_manager.dart';
import 'package:parkinson_app/data/model/doctor.dart';

class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel() : super(LoadingState());

  List<DoctorData> doctors = [];
  List<DoctorData> filteredDoctors = [];

  void doctorList() async {
    try {
      emit(LoadingState());
      var response = await ApiManager.doctorList();
      if (response.status == 200) {
        doctors = response.data;
        filteredDoctors = List.from(doctors);
        emit(HideLoadingState());
        emit(SuccessState("Doctor list loaded successfully"));
      } else {
        emit(HideLoadingState());
        emit(ErrorState('Failed to load doctor list'));
      }
    } catch (e) {
      emit(HideLoadingState());
      emit(ErrorState(e.toString()));
    }
  }

  void searchDoctors(String query) {
    if (query.isEmpty) {
      filteredDoctors = List.from(doctors);
    } else {
      filteredDoctors = doctors
          .where((doctor) =>
              doctor.name.toLowerCase().contains(query.toLowerCase()) ||
              doctor.address.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(DoctorSearchState(filteredDoctors));
  }
}

// HomeState
abstract class HomeState {}

class LoadingState extends HomeState {}

class ErrorState extends HomeState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}

class SuccessState extends HomeState {
  final String message;

  SuccessState(this.message);
}

class HideLoadingState extends HomeState {}

class DoctorSearchState extends HomeState {
  final List<DoctorData> filteredDoctors;

  DoctorSearchState(this.filteredDoctors);
}
