import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:parkinson_app/data/model/doctor.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_buttom.dart';

class ViewDoctorScreen extends StatefulWidget {
  const ViewDoctorScreen({Key? key}) : super(key: key);
  static const String screenName = "viewDoctorScreen";

  @override
  State<ViewDoctorScreen> createState() => _ViewDoctorScreenState();
}

class _ViewDoctorScreenState extends State<ViewDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    DoctorData doctor =
        ModalRoute.of(context)?.settings.arguments as DoctorData;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Doctor'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              height: size.height * .40,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(doctor.img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: size.height * .02),
                    const Text(
                      'Physiatrist',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff888888)),
                    ),
                    SizedBox(height: size.height * .02),
                    const Text(
                      'About',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: size.height * .02),
                    const Text(
                      'Dr. Ahmed Ali is an assistant professor of neurology at Ain Shams University and former director of the Neurology Unit at Ain Shams University Specialized Hospital, he is currently the director of NeurMed Clinic. ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff888888)),
                    ),
                    SizedBox(height: size.height * .02),
                    const Text(
                      'Location',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: size.height * .02),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined,
                            color: Color(0xff888888)),
                        Text(
                          doctor.address,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff888888)),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * .02),
                    const Text(
                      'Working Time',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: size.height * .02),
                    const Row(
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
                    SizedBox(height: size.height * .02),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .06),
                      child: CustomElevatedButton(
                          onPressed: () {}, label: 'Continue Booking'),
                    ),
                    SizedBox(height: size.height * .02),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
