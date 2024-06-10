import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/booked_appointment/booked_appoitnment_screen.dart';
import 'package:parkinson_app/presentation/services/disease_information/disease_information.dart';
import 'package:parkinson_app/presentation/services/disease_result/diseae_result.dart';
import 'package:parkinson_app/presentation/services/services_widgets.dart';

class ServicesScreen extends StatefulWidget {
  static const String screenName = "services";
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .02, vertical: size.height * .03),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * .05,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * .02,
                          vertical: size.height * .03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, DiseaseResultScreen.screenName),
                            child: const ServicesWidgets(
                                imagePath: 'assets/images/disease_results.png',
                                tittle: 'Disease Results'),
                          ),
                          InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, DiseaseInformationScreen.screenName),
                            child: const ServicesWidgets(
                                imagePath:
                                    'assets/images/disease_information.png',
                                tittle: 'Disease Information'),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .02,
                              vertical: size.height * .03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => Navigator.pushNamed(context,
                                    BookedAppoitnmentScreen.screenName),
                                child: const ServicesWidgets(
                                    imagePath:
                                        'assets/images/appointment_icon.png',
                                    tittle: 'Appointments'),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  right: size.width * .11,
                                  top: size.height * .03,
                                  left: size.width * .11),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Image(
                                  image: const AssetImage(
                                    'assets/images/voice_assistant.png',
                                  ),
                                  width: size.width * .3,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * .01,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * .02),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Voice Assistant (soon)",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
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
