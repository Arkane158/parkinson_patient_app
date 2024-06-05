import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:parkinson_app/pref/user_save_shared_prefrence.dart';
import 'package:parkinson_app/presentation/login/login_screen.dart';
import 'package:parkinson_app/presentation/profile/about_us/about_us_screen.dart';
import 'package:parkinson_app/presentation/profile/account/edit_account.dart';
import 'package:parkinson_app/presentation/profile/help/help_screen.dart';
import 'package:parkinson_app/presentation/profile/privacy%20policy/privacy_policy_screen.dart';
import 'package:parkinson_app/presentation/profile/setting_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String screenName = "profileScreen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? name;
  String? img;
  String? email;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    name = await UserPref.getUserName();
    img = await UserPref.getUserImg();
    email = await UserPref.getUserEmail();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.height * .33,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * .05,
                    vertical: size.height * .07,
                  ),
                  child: Container(
                    height: size.height * .65,
                    width: size.width * 2,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: size.height * .08,
                            ),
                            child: Text(name ?? ''),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(email ?? ''),
                          ),
                          SettingWidgets(
                            leading: const Icon(
                              Icons.perm_contact_calendar_outlined,
                              color: Color(0xff41545E),
                              size: 40,
                            ),
                            action: const Icon(
                              Icons.arrow_forward_ios,
                              size: 40,
                              color: Color(0xff41545E),
                            ),
                            title: 'Account',
                            voidCallback: () {
                              Navigator.pushNamed(
                                  context, EditAccount.screenName);
                            },
                          ),
                          SettingWidgets(
                            leading: const Icon(
                              Icons.lock_person_outlined,
                              color: Color(0xff41545E),
                              size: 40,
                            ),
                            action: const Icon(
                              Icons.arrow_forward_ios,
                              size: 40,
                              color: Color(0xff41545E),
                            ),
                            title: 'Privacy Policy',
                            voidCallback: () {
                              Navigator.pushNamed(
                                  context, PrivacyPolicyScreen.screenName);
                            },
                          ),
                          SettingWidgets(
                            leading: const Icon(
                              Icons.info_outline_rounded,
                              color: Color(0xff41545E),
                              size: 40,
                            ),
                            action: const Icon(
                              Icons.arrow_forward_ios,
                              size: 40,
                              color: Color(0xff41545E),
                            ),
                            title: 'About us',
                            voidCallback: () {
                              Navigator.pushNamed(
                                  context, AboutUsScreen.screenName);
                            },
                          ),
                          SettingWidgets(
                            leading: const Icon(
                              Icons.help_outline_rounded,
                              color: Color(0xff41545E),
                              size: 40,
                            ),
                            action: const Icon(
                              Icons.arrow_forward_ios,
                              size: 40,
                              color: Color(0xff41545E),
                            ),
                            title: 'Help & Support',
                            voidCallback: () {
                              Navigator.pushNamed(
                                  context, HelpScreen.screenName);
                            },
                          ),
                          SettingWidgets(
                            leading: const Icon(
                              Icons.logout_rounded,
                              color: Color(0xff41545E),
                              size: 40,
                            ),
                            action: const Icon(
                              Icons.arrow_forward_ios,
                              size: 40,
                              color: Colors.transparent,
                            ),
                            title: 'Logout',
                            voidCallback: () {
                              UserPref.clearUserData();
                              Navigator.pushReplacementNamed(
                                  context, LoginScreen.screenName);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: img != null && img!.isNotEmpty
                    ? Center(
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => Dialog(
                                child: CachedNetworkImage(
                                  imageUrl: img!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: img!,
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
                              radius: size.width * 0.14,
                              backgroundColor: Colors.transparent,
                              backgroundImage: imageProvider,
                            ),
                            placeholder: (context, url) => CircleAvatar(
                              radius: size.width * 0.14,
                              backgroundColor: Colors.grey,
                              child: const Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            errorWidget: (context, url, error) => CircleAvatar(
                              radius: size.width * 0.14,
                              backgroundColor: Colors.grey,
                              child: const Icon(
                                Icons.error,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: CircleAvatar(
                          radius: size.width * 0.14,
                          backgroundColor: Colors.grey,
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
