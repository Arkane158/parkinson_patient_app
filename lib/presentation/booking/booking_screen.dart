import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:parkinson_app/model/model/appointment.dart';
import 'package:parkinson_app/model/model/doctor.dart';
import 'package:parkinson_app/presentation/booking/appointment_tittle.dart';
import 'package:parkinson_app/presentation/booking/book_view_model.dart';
import 'package:parkinson_app/presentation/booking/date_picker.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_buttom.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);
  static const String screenName = "BookingScreen";

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? selectedDate;
  String? dayOfMonth;
  String? month;
  String? year;
  List<Slots>? slots;
  String? appointmentId;
  Slots? selectedSlot; // Add this variable

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    DoctorData doctor =
        ModalRoute.of(context)?.settings.arguments as DoctorData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment'),
      ),
      body: BlocProvider(
        create: (context) => BookViewModel(),
        child: BlocConsumer<BookViewModel, BookState>(
          listener: (context, state) {
            if (state is ErrorState) {
              // DialogeUtils.showMessage(context, state.errorMessage,
              //     posActionTitle: 'Ok');
            } else if (state is AppointmentsLoadedState) {
              setState(() {
                slots = state.response.result;
                appointmentId = state.response.appointmentId;
              });
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: WeekPicker(
                    itemWidth: size.width * .24,
                    onDateSelected: (date) {
                      setState(() {
                        selectedDate = date;
                        dayOfMonth = DateFormat('d').format(date);
                        month = DateFormat('M').format(date);
                        year = DateFormat('yyyy').format(date);
                        slots = null; // Reset slots to show loading state
                        selectedSlot = null; // Reset selected slot
                      });
                      BlocProvider.of<BookViewModel>(context)
                          .availableAppointments(
                        dayOfMonth: dayOfMonth!,
                        month: month!,
                        year: year!,
                        doctorId: doctor.userId,
                      );
                    },
                    primaryColor: Theme.of(context).primaryColor,
                  ),
                ),
                Expanded(
                  child: state is LoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : slots == null
                          ? const Center(
                              child: Text('No Available Appointments'))
                          : slots!.isEmpty
                              ? const Center(
                                  child: Text('No available appointments'))
                              : GridView.builder(
                                  padding: const EdgeInsets.all(8.0),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                    childAspectRatio:
                                        2.5, // Adjusted for a more compact layout
                                  ),
                                  itemCount: slots!.length,
                                  itemBuilder: (context, index) {
                                    final slot = slots![index];
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedSlot = slot;
                                        });
                                      },
                                      child: AppointmentTile(
                                        slot: slot,
                                        isSelected: slot == selectedSlot,
                                      ),
                                    );
                                  },
                                ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * .02,
                      horizontal: size.width * .05),
                  child: CustomElevatedButton(
                    onPressed: () async {
                      if (selectedSlot == null) {
                        // Show a dialog indicating that the user needs to choose an appointment slot first
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Choose Appointment'),
                            content: const Text(
                              'Please select an appointment before booking.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        // Show loading dialog
                        showDialog(
                          context: context,
                          barrierDismissible:
                              false, // prevent dismissing by tapping outside
                          builder: (context) => const AlertDialog(
                            content: Row(
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(width: 16),
                                Text('Booking Appointment...'),
                              ],
                            ),
                          ),
                        );

                        // Call the reserveAppointment method of the view model
                        final viewModel =
                            BlocProvider.of<BookViewModel>(context);
                        await viewModel.reserveAppointment(
                          appointmentId: appointmentId!,
                          doctorName: doctor.name,
                          patientName:
                              'Your patient name', // Replace with actual patient name
                          doctorId: doctor.userId,
                          timeOfDay: selectedSlot!.time,
                          dayOfMonth: dayOfMonth!,
                          month: month!,
                          year: year!,
                          doctorImg: doctor.img,
                          dayOfWeek: DateFormat('EEEE').format(selectedDate!),
                        );

                        // Close the loading dialog
                        Navigator.pop(context);

                        // Show the response message in another dialog
                        showDialog(
                          context: context,
                          builder: (context) {
                            final state = viewModel.state;
                            String title = '';
                            String message = '';

                            if (state is SuccessState) {
                              title = 'Success';
                              message = state.message;
                            } else if (state is ErrorState) {
                              title = 'Error';
                              message = state.errorMessage;
                            }

                            return AlertDialog(
                              title: Text(title),
                              content: Text(message),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Close the dialog
                                    setState(() {
                                      // Refresh the screen by resetting the selectedSlot
                                      selectedSlot = null;
                                    });
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    label: 'Book Appointment',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
