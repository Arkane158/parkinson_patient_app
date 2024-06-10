// HomeViewModel
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/model/api_manager.dart';
import 'package:parkinson_app/model/model/doctor.dart';

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
        // Show only the first 10 doctors by default
        filteredDoctors = doctors.take(10).toList();
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
      // If the query is empty, show the initial list of doctors (up to the first 10 doctors)
      filteredDoctors = doctors.take(10).toList();
    } else {
      // If the query is not empty, filter the list of doctors by name or address
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
