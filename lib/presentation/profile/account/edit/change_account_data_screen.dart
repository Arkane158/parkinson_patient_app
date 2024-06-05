import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkinson_app/pref/user_save_shared_prefrence.dart';
import 'package:parkinson_app/presentation/bottom_app_bar/app_bar_bottom_nav_bar.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_elevated_buttom.dart';
import 'package:parkinson_app/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:parkinson_app/presentation/custom_widgets/dialoge_utils.dart';
import 'package:parkinson_app/presentation/profile/account/edit_account_view_model.dart';

class ChangeAccountDataScreen extends StatefulWidget {
  const ChangeAccountDataScreen({super.key});
  static const String screenName = "change_account_data_screen";

  @override
  State<ChangeAccountDataScreen> createState() =>
      _ChangeAccountDataScreenState();
}

class _ChangeAccountDataScreenState extends State<ChangeAccountDataScreen> {
  EditAccountViewModel viewModel = EditAccountViewModel();
  TextEditingController editController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? phone;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    String? doctorName = await UserPref.getUserName();
    String? doctorEmail = await UserPref.getUserEmail();
    String? doctorPhone = await UserPref.getUserPhone();
    setState(() {
      name = doctorName;
      email = doctorEmail;
      phone = doctorPhone;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String title = '';
    title = ModalRoute.of(context)?.settings.arguments as String;
    var height = MediaQuery.of(context).size.height;
    var spacing = height * .02;

    return Scaffold(
      appBar: AppBar(
        title: Text('Change $title'),
      ),
      body: BlocProvider(
        create: (context) => viewModel,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .02, vertical: size.height * .02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      type: title == 'phone'
                          ? TextInputType.phone
                          : TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        if (title == 'phone' && value.length != 11) {
                          return 'Phone number must be 11 digits';
                        }
                        return null;
                      },
                      title: title,
                      controller: editController,
                      hint: 'Enter the New $title',
                      icon: const Icon(Icons.edit),
                    ),
                    SizedBox(height: spacing),
                    CustomTextFormField(
                      title: 'Examination Time',
                      controller: editController,
                      hint: 'Time of 1 ex in minutes',
                      icon: const Icon(Icons.timer),
                      type: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter examination time';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: spacing),
                  ],
                ),
              ),
              BlocConsumer<EditAccountViewModel, EditAccountState>(
                listener: (context, state) {
                  if (state is LoadingState) {
                    DialogeUtils.showProgressDialog(context, 'Loading...');
                  } else if (state is ErrorState) {
                    DialogeUtils.showMessage(context, state.errorMessage,
                        posActionTitle: 'Ok');
                  } else if (state is SuccessState) {
                    DialogeUtils.showMessage(context, state.message,
                        posActionTitle: 'Ok', posAction: () {
                      Navigator.pushReplacementNamed(
                          context, AppBarAndBottomNav.screenName);
                    });
                  } else if (state is HideLoadingState) {
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                    child: CustomElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                           if (title == 'phone') {
                            phone = editController.text;
                          } else if (title == 'name') {
                            name = editController.text;
                          }
                          viewModel.editProfile(
                            phone: phone!,
                            name: name!,
                          );
                        }
                      },
                      label: "Submit",
                    ),
                  );
                },
              ),
              SizedBox(
                height: size.height * .02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
