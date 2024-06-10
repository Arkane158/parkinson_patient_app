import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/pref/user_save_shared_prefrence.dart';
import 'package:parkinson_app/presentation/booked_appointment/booked_appoitnment_view_model.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_appointment_widget.dart';
import 'package:parkinson_app/presentation/custom_widgets/dialoge_utils.dart';

class BookedAppoitnmentScreen extends StatefulWidget {
  const BookedAppoitnmentScreen({super.key});
  static const String screenName = "BookedAppoitnmentScreen";

  @override
  State<BookedAppoitnmentScreen> createState() =>
      _BookedAppoitnmentScreenState();
}

class _BookedAppoitnmentScreenState extends State<BookedAppoitnmentScreen> {
  late BookedAppoitnmentViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = BookedAppoitnmentViewModel();
    _loadAppointments();
  }

  void _loadAppointments() async {
    final userId = await UserPref.getUserId(); // Fetch userId from UserPref
    viewModel.bookedAppointment(userId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
      ),
      body: BlocProvider(
        create: (context) => viewModel,
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<BookedAppoitnmentViewModel,
                  BookedAppoitnmentState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ErrorState) {
                    return Center(child: Text(state.errorMessage));
                  } else if (state is SuccessState) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: viewModel.appointments.length,
                        itemBuilder: (context, index) {
                          final appointment = viewModel.appointments[index];
                          return CustomAppointmentWidget(
                            appointment: appointment,
                            cancelFun: (_) async {
                              viewModel.canelAppoitment(
                                  appointmentId: appointment.appointmentId,
                                  reserveId: appointment.id,
                                  timeOfDay: appointment.timeOfDay);
                              BlocConsumer<BookedAppoitnmentViewModel,
                                  BookedAppoitnmentState>(
                                listener: (context, state) {
                                  if (state is LoadingState) {
                                    DialogeUtils.showProgressDialog(
                                        context, 'Cancelling The Appointment');
                                  }
                                  if (state is ErrorState) {
                                    DialogeUtils.showMessage(
                                        context, state.errorMessage);
                                    if (state is SuccessState) {
                                      DialogeUtils.showMessage(
                                          context, 'cancelled succsfully');
                                    }
                                  }
                                },
                                builder: (context, state) {
                                  return Container();
                                },
                              );
                              final userId = await UserPref
                                  .getUserId(); // Fetch userId from UserPref

                              viewModel.bookedAppointment(userId!);
                            },
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(child: Text('No appointments found'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
