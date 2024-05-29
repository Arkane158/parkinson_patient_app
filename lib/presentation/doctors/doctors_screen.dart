import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_doctor_widget.dart';
import 'package:parkinson_app/presentation/view_doctor/view_doctor_screen.dart';

class DoctorsScreen extends StatelessWidget {
  static const String screenName = "doctorScreen";
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CustomDoctorWidget> customdoctorWidgets = List.generate(
      20,
      (index) => const CustomDoctorWidget(),
    );

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     'Doctors',
          //     style: Theme.of(context).textTheme.headlineSmall,
          //   ),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: size.width * .02, // Spacing between columns
                  mainAxisSpacing: size.height * .02, // Spacing between rows
                ),
                itemCount: customdoctorWidgets.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, ViewDoctorScreen.screenName),
                    child: customdoctorWidgets[index],
                  ); // Display item from the list
                },
              ),
            ),
          ),
          SizedBox(
            height: size.height * .02,
          )
        ],
      ),
    );
  }
}
