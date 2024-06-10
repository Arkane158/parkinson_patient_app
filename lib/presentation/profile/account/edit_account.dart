import 'package:flutter/material.dart';
import 'package:parkinson_app/pref/user_save_shared_prefrence.dart';
import 'package:parkinson_app/presentation/profile/account/edit/change_account_data_screen.dart';
import 'package:parkinson_app/presentation/profile/account/edit/change_img_screen.dart';
import 'package:parkinson_app/presentation/profile/account/edit_account_section.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);
  static const String screenName = "EditAccount";

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  String? name;
  String? img;
  String? email;
  String? phone;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    name = await UserPref.getUserName();
    img = await UserPref.getUserImg();
    email = await UserPref.getUserEmail();
    phone = await UserPref.getUserPhone();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .02),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, ChangePersonalPhoto.screenName,
                        arguments: img),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: img != null
                          ? CachedNetworkImageProvider(img!)
                          : const AssetImage('assets/images/unkown.png')
                              as ImageProvider,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Account Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, ChangeAccountDataScreen.screenName,arguments: 'name'),
                    child: EditAccountSection(
                      tittle: 'User Name',
                      icon: const Icon(Icons.person_outline),
                      content: name ?? '',
                    ),
                  ),
                  EditAccountSection(
                    tittle: 'Email',
                    icon: const Icon(Icons.email_outlined),
                    content: email ?? '',
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, ChangeAccountDataScreen.screenName,arguments: 'phone'),
                    child: EditAccountSection(
                      tittle: 'Phone ',
                      icon: const Icon(Icons.phone_outlined),
                      content: phone ?? '',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
