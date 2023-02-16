import 'package:auth_app/features/authentication/screens/app_bar.dart';
import 'package:auth_app/features/authentication/screens/setting_item.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(
          title: 'Profile',
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(221, 26, 26, 26),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 35,
                              backgroundImage:
                                  AssetImage('assets/images/mine.jpg'),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Hermes Gido',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('hermesgido@gmail.com'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  ),
                ),
                SettingItem(
                  title: 'Payments & Purchases',
                  icon: Icons.payment,
                  icon2: Icons.arrow_forward_ios,
                ),
                SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Settings & Preferences',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                SettingItem(
                  title: 'Notification',
                  icon: Icons.notifications,
                  icon2: Icons.arrow_forward_ios,
                ),
                SettingItem(
                  title: 'Language',
                  icon: Icons.language,
                  icon2: Icons.arrow_forward_ios,
                ),
                SettingItem(
                  title: 'Security',
                  icon: Icons.security,
                  icon2: Icons.arrow_forward_ios,
                ),
                SettingItem(
                  title: 'Dark Mode',
                  icon: Icons.dark_mode,
                  icon2: Icons.toggle_on,
                ),
                SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Support',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                SettingItem(
                  title: 'Help Center',
                  icon: Icons.help_center,
                  icon2: Icons.arrow_forward_ios,
                ),
                SettingItem(
                  title: 'Report Bug',
                  icon: Icons.bug_report,
                  icon2: Icons.arrow_forward_ios,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
