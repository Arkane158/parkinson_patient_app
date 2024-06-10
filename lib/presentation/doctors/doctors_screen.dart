import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/model/model/doctor.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_grid_view_widget.dart';
import 'package:parkinson_app/presentation/home/home_view_model.dart';
import 'package:parkinson_app/presentation/view_doctor/view_doctor_screen.dart';

class DoctorsScreen extends StatefulWidget {
  static const String screenName = "doctorScreen";

  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  List<DoctorData> doctors = [];
  HomeViewModel viewModel = HomeViewModel();
  List<DoctorData> doctor = [];

  @override
  void initState() {
    super.initState();
    // Initial load
    viewModel
        .doctorList(); // Load the doctor list when the widget is initialized
    doctor = viewModel.doctors;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Reload user image and doctor list every time the widget is re-initialized
    viewModel.doctorList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocProvider(
        create: (context) => viewModel,
        child: Column(
          children: [
            BlocBuilder<HomeViewModel, HomeState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ErrorState) {
                  return Center(child: Text(state.errorMessage));
                } else if (state is SuccessState) {
                  final doctors = viewModel.doctors;

                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          mainAxisSpacing: size.height * .03,
                          crossAxisSpacing: size.width * .04,
                          childAspectRatio:
                              0.75, // Adjust to control item height
                        ),
                        itemCount: doctors.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.pushNamed(
                              context,
                              ViewDoctorScreen.screenName,
                              arguments: doctors[
                                  index], // Passing the doctor data to the detail screen
                            ),
                            child: SizedBox(
                              height: size.height *
                                  .5, // Ensure height is specified
                              child: CustomDoctorWidget(doctor: doctors[index]),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return const Center(child: Text('No data available'));
                }
              },
            ),
            SizedBox(height: size.height * .02),
          ],
        ),
      ),
    );
  }
}
