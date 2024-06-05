import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_doctor_widget.dart';

class MoreDoctorScreen extends StatelessWidget {
  const MoreDoctorScreen({super.key});
  static const String screenName = "MoreDoctorScreen";

  @override
  Widget build(BuildContext context) {
    List<CustomDoctorWidget> customDoctorWidgets = [

    ];

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Doctors'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Popular Doctors',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.7, // Adjust the aspect ratio as needed
                children: customDoctorWidgets,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
