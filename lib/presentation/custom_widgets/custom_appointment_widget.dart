import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:parkinson_app/model/model/appointment_result.dart';

class CustomAppointmentWidget extends StatelessWidget {
  final AppointmentResult appointment;
  final void Function(BuildContext)? cancelFun;

  const CustomAppointmentWidget(
      {Key? key, required this.appointment, required this.cancelFun})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              onPressed: cancelFun,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.cancel_outlined,
              label: 'Cancel ',
            ),
          ],
        ),
        child: AppointmentTile(appointment: appointment),
      ),
    );
  }
}

class AppointmentTile extends StatelessWidget {
  final AppointmentResult appointment;

  const AppointmentTile({Key? key, required this.appointment})
      : super(key: key);

  String _getMonthName(String? month) {
    if (month == null) {
      return 'Unknown';
    }
    switch (month) {
      case '1':
        return 'January';
      case '2':
        return 'February';
      case '3':
        return 'March';
      case '4':
        return 'April';
      case '5':
        return 'May';
      case '6':
        return 'June';
      case '7':
        return 'July';
      case '8':
        return 'August';
      case '9':
        return 'September';
      case '10':
        return 'October';
      case '11':
        return 'November';
      case '12':
        return 'December';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 240, 236, 236),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomAppointmentAvatar(appointment: appointment),
                Row(
                  children: [
                    const Icon(
                      Icons.watch_later_outlined,
                      color: Color(0xff757575),
                      size: 25,
                    ),
                    Text(
                      appointment.timeOfDay,
                      style: const TextStyle(
                          color: Color(0xff757575),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      color: Color(0xff757575),
                      size: 25,
                    ),
                    Text(
                      ' ${appointment.dayOfWeek} : ${appointment.dayOfMonth} ${_getMonthName(appointment.month)} ${appointment.year.toString()}',
                      style: const TextStyle(
                          color: Color(0xff757575),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Text(appointment.appointmentStatus)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppointmentAvatar extends StatelessWidget {
  final AppointmentResult appointment;

  const CustomAppointmentAvatar({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Row(
      children: [
        CircleAvatar(
          radius: size.width * .08,
          backgroundColor: Colors.transparent,
          backgroundImage: CachedNetworkImageProvider(appointment.doctorImg),
        ),
        SizedBox(
          width: size.width * .02,
        ),
        Text(
          appointment.doctorName,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor),
        ),
      ],
    );
  }
}
