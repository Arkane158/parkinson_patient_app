import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parkinson_app/presentation/custom_widgets/auth_widget.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_buttom.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:parkinson_app/presentation/custom_widgets/dialoge_utils.dart';
import 'package:parkinson_app/presentation/login/login_screen.dart';
import 'package:parkinson_app/presentation/signup/signup_view_model.dart';
import 'package:parkinson_app/presentation/verify%20screen/verify_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const String screenName = "signup-screen";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  File? file;
  String? gender;

  SignUpViewModel viewModel = SignUpViewModel();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocProvider(
        create: (context) => viewModel,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .03),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          const AuthWidget(tittle: 'SignUp'),
                          InkWell(
                            onTap: () {
                              _showImageSourceBottomSheet(context);
                            },
                            child: Center(
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 70,
                                    backgroundImage: file != null
                                        ? FileImage(File(file!.path))
                                        : const AssetImage(
                                                'assets/images/doctor.png')
                                            as ImageProvider<Object>?,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor:
                                          Colors.grey.withOpacity(0.5),
                                      child: const Icon(Icons.camera_alt),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CustomTextFormField(
                            title: 'User Name',
                            controller: _userNameController,
                            hint: 'User Name',
                            icon: const Icon(Icons.person_outline_rounded),
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'User Name is required';
                              }
                              return null; // Return null if the user name is valid
                            },
                          ),
                          SizedBox(
                            height: height * .04,
                          ),
                          CustomTextFormField(
                            title: 'Email',
                            controller: _emailController,
                            hint: 'Email',
                            icon: const Icon(Icons.email_outlined),
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Email is required';
                              }
                              // This regex pattern checks if the email format is valid
                              final emailRegExp =
                                  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                              if (!emailRegExp.hasMatch(text)) {
                                return 'Please enter a valid email address';
                              }
                              return null; // Return null if the email is valid
                            },
                          ),
                          SizedBox(
                            height: height * .04,
                          ),
                          CustomTextFormField(
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Phone is required';
                              }
                              if (text.length != 11) {
                                return '11 digits are required';
                              }
                              return null;
                            },
                            title: 'Phone',
                            controller: _phoneController,
                            type: TextInputType.phone,
                            hint: 'Phone',
                            icon: const Icon(Icons.phone_outlined),
                          ),
                          SizedBox(
                            height: height * .04,
                          ),
                          CustomTextFormField(
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            },
                            title: 'Password',
                            controller: _passwordController,
                            hint: 'Password',
                            icon: const Icon(Icons.lock_outline_rounded),
                          ),
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text(
                                  'Gender',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontSize: 14),
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: RadioListTile(
                                  title: const Text(
                                    'Male',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  value: 'male',
                                  groupValue: gender,
                                  activeColor: Theme.of(context).primaryColor,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: RadioListTile(
                                  title: const Text(
                                    'Female',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  value: 'female',
                                  groupValue: gender,
                                  activeColor: Theme.of(context).primaryColor,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * .04,
                          ),
                          BlocConsumer<SignUpViewModel, SignUpState>(
                              listener: (context, state) {
                            if (state is LoadingState) {
                              DialogeUtils.showProgressDialog(
                                  context, 'Loading...');
                            } else if (state is ErrorState) {
                              DialogeUtils.showMessage(
                                  context, state.errorMessage,
                                  posActionTitle: 'Ok');
                            } else if (state is SuccessState) {
                              DialogeUtils.showMessage(context, state.message,
                                  posActionTitle: 'Ok', posAction: () {
                                Navigator.pushReplacementNamed(
                                    context, VerifyScreen.screenName,
                                    arguments: [
                                      _emailController.text,
                                      SignUpScreen.screenName,
                                    ]);
                              });
                            } else if (state is HideLoadingState) {
                              Navigator.pop(context);
                            }
                          }, builder: (context, state) {
                            return CustomElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate() &&
                                    file != null) {
                                  viewModel.signUp(
                                      file!,
                                      _passwordController.text,
                                      _emailController.text,
                                      gender!,
                                      _userNameController.text,
                                      _phoneController.text);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Please fill all required fields'),
                                    ),
                                  );
                                }
                              },
                              label: "Sign Up",
                            );
                          }),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height * .02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account ?  ',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, LoginScreen.screenName);
                                  },
                                  child: Text(
                                    'Login',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp(BuildContext context) async {
    if (_formKey.currentState?.validate() == false) {
      return;
    }
    // Perform signup logic here
  }

  void _showImageSourceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final myfile = await picker.pickImage(source: source);
    if (myfile == null) return;
    setState(() {
      file = File(myfile.path);
    });
  }
}
