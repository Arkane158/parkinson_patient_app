import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_buttom.dart';

class ViewDoctorScreen extends StatefulWidget {
  const ViewDoctorScreen({super.key});
  static const String screenName = "viewDoctorScreen";

  @override
  State<ViewDoctorScreen> createState() => _ViewDoctorScreenState();
}

class _ViewDoctorScreenState extends State<ViewDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double spacing = size.height * .02;

    return Scaffold(
      backgroundColor: Colors.white, // Background color

      appBar: AppBar(
        title: const Text('Doctor'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * .3,
                  color: Theme.of(context).primaryColor,
                ),
                Positioned(
                  top: size.height * .005,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Image.asset(
                        'assets/images/d.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: size.height * .05,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Dr. Ahmed Ali',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: spacing,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Physiatrist',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff888888)),
                    ),
                  ),
                  SizedBox(
                    height: spacing,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'About',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: spacing,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Dr. Ahmed Ali is an assistant professor of neurology at Ain Shams University and former director of the Neurology Unit at Ain Shams University Specialized Hospital, he is currently the director of NeurMed Clinic. ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff888888)),
                    ),
                  ),
                  SizedBox(
                    height: spacing,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Location',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: spacing,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: Color(0xff888888)),
                        Text(
                          'Nasr City, Cairo ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff888888)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: spacing,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Working Time',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: spacing,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Icon(Icons.timer, color: Color(0xff888888)),
                        Text(
                          'Sat - Tue 10:30AM - 6:00PM  ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff888888)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .06, vertical: spacing),
              child: CustomElevatedButton(
                  onPressed: () {}, label: 'Continue Booking'),
            ),
            SizedBox(
              height: spacing,
            ),
          ],
        ),
      ),
    );
  }
}
