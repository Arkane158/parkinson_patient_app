import 'package:flutter/material.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_doctor_widget.dart';
import 'package:parkinson_app/presentation/custom_widgets/search_text_from.dart';
import 'package:parkinson_app/presentation/services/disease_information/disease_information.dart';
import 'package:parkinson_app/presentation/view_doctor/view_doctor_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String screenName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _seaarchController = TextEditingController();
  List<CustomDoctorWidget> customdoctorWidgets = [
    const CustomDoctorWidget(),
    const CustomDoctorWidget(),
    const CustomDoctorWidget(),
    const CustomDoctorWidget(),
    const CustomDoctorWidget(),
    const CustomDoctorWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: size.height * .4,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor),
                      ),
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: CircleAvatar(
                                      radius: size.width * .06,
                                      backgroundImage: const AssetImage(
                                          'assets/images/patient.jpeg'),
                                    ),
                                  ),
                                  const Text(
                                    'Ahmed Mohamed',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * .02,
                                    left: size.width * .03),
                                child: Text(
                                  'Welcome',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * .01,
                                    left: size.width * .03),
                                child: Text(
                                  'Find Your Specialist',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: size.height * .01,
                                    horizontal: size.width * .03),
                                child: SearchTextField(
                                    hintText: 'Search Doctor....',
                                    controller: _seaarchController),
                              ),
                              SizedBox(
                                height: size.height * .01,
                              )
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.height * .005,
                                ),
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size.height * .01,
                                        horizontal: size.width * .03),
                                    child: Container(
                                      height: size.height * .2,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                            child: ColorFiltered(
                                              colorFilter: ColorFilter.mode(
                                                Colors.black.withOpacity(
                                                    0.6), // Adjust opacity as needed
                                                BlendMode.darken,
                                              ),
                                              child: Image.asset(
                                                'assets/images/patient_home.jpeg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'About Disease',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: size.height * .02,
                                                ),
                                                const Text(
                                                  "Parkinson's disease is a progressive disorder that affects the nervous system and the parts of the body controlled by the nerves.",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Colors.white),
                                                    shape: MaterialStateProperty
                                                        .all<
                                                            RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                20), // Add your desired radius
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context,
                                                        DiseaseInformationScreen
                                                            .screenName);
                                                  },
                                                  child: const Text("See More",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors
                                                              .black)), // Change text color if needed
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.height * .01,
                                      horizontal: size.width * .03),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Doctors ',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.width * .7,
                                  child: ListView.builder(
                                    // Disable scrolling
                                    shrinkWrap:
                                        true, // Take up only the space it needs
                                    padding: const EdgeInsets.all(15),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: customdoctorWidgets.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * .02),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                ViewDoctorScreen.screenName);
                                          },
                                          child: customdoctorWidgets[index],
                                        ), // Display item from the list
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
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
    );
  }
}
