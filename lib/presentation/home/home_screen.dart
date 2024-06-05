import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/data/model/doctor.dart';
import 'package:parkinson_app/pref/user_save_shared_prefrence.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_doctor_widget.dart';
import 'package:parkinson_app/presentation/custom_widgets/search_text_from.dart';
import 'package:parkinson_app/presentation/home/home_view_model.dart';
import 'package:parkinson_app/presentation/services/disease_information/disease_information.dart';
import 'package:parkinson_app/presentation/view_doctor/view_doctor_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String screenName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  HomeViewModel viewModel = HomeViewModel();
  String? img;
  String? userName;
  List<DoctorData> doctor = [];

  @override
  void initState() {
    super.initState();
    // Initial load
    loadUserImage().then((_) {
      viewModel
          .doctorList(); // Load the doctor list after loading the user image
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Reload user image every time the widget is re-initialized
    loadUserImage();
  }

  Future<void> loadUserImage() async {
    img = await UserPref.getUserImg();
    userName = await UserPref.getUserName();
    setState(() {});
  }

  void _searchDoctors(String query) {
    viewModel.searchDoctors(query);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
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
                            color: Theme.of(context).primaryColor,
                          ),
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
                                      child: img != null && img!.isNotEmpty
                                          ? CircleAvatar(
                                              radius: size.width * .06,
                                              backgroundColor:
                                                  Colors.transparent,
                                              backgroundImage:
                                                  NetworkImage(img!),
                                            )
                                          : CircleAvatar(
                                              radius: size.width * .06,
                                              backgroundColor: Colors.grey,
                                              child: const Icon(
                                                Icons.person,
                                                color: Colors.white,
                                              ),
                                            ),
                                    ),
                                    userName == null
                                        ? const CircularProgressIndicator()
                                        : Text(
                                            userName!,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * .02,
                                    left: size.width * .03,
                                  ),
                                  child: Text(
                                    'Welcome',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * .01,
                                    left: size.width * .03,
                                  ),
                                  child: Text(
                                    'Find Your Specialist',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: size.height * .01,
                                    horizontal: size.width * .03,
                                  ),
                                  child: SearchTextField(
                                    hintText: 'Search Doctor....',
                                    controller: _searchController,
                                    onChanged:
                                        _searchDoctors, // Call _searchDoctors method on text change
                                  ),
                                ),
                                SizedBox(height: size.height * .01),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: size.height * .007),
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: size.height * .01,
                                        horizontal: size.width * .03,
                                      ),
                                      child: Container(
                                        height: size.height * .23,
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          size.height * .02),
                                                  const Text(
                                                    "Parkinson's disease is a progressive disorder that affects the nervous system and the parts of the body controlled by the nerves.",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          WidgetStateProperty
                                                              .all<Color>(
                                                                  Colors.white),
                                                      shape: WidgetStateProperty
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
                                                    child: const Text(
                                                      "See More",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors
                                                              .black), // Change text color if needed
                                                    ),
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
                                      horizontal: size.width * .03,
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Top Doctors',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  BlocBuilder<HomeViewModel, HomeState>(
                                    builder: (context, state) {
                                      if (state is LoadingState) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      } else if (state is ErrorState) {
                                        return Center(
                                            child: Text(state.errorMessage));
                                      } else if (state is DoctorSearchState) {
                                        return SizedBox(
                                          height: size.width * .7,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.all(15),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: state.filteredDoctors
                                                .length, // Use the length of filtered doctors
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        size.width * .02),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.pushNamed(
                                                        context,
                                                        ViewDoctorScreen
                                                            .screenName,
                                                        arguments: state
                                                                .filteredDoctors[
                                                            index]);
                                                  },
                                                  child: CustomDoctorWidget(
                                                      doctor: state
                                                              .filteredDoctors[
                                                          index]), // Use filtered doctor list
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      } else {
                                        return const Center(
                                            child: Text('No data available'));
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
