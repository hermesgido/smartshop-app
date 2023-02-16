import 'package:auth_app/features/authentication/controllers/user_provider.dart';
import 'package:auth_app/features/authentication/screens/analytics_tabs.dart';
import 'package:auth_app/features/authentication/screens/drawer_item.dart';
import 'package:auth_app/features/authentication/screens/home_page.dart';
import 'package:auth_app/features/authentication/screens/profile.dart';
import 'package:auth_app/features/authentication/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationDrawer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(221, 17, 17, 17),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(border: Border(bottom: BorderSide.none)),
            child: Column(
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/mine.jpg'),
                  radius: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('HERMES GIDO'),
                Text('hermesgido@gmail.com'),
              ],
            ),
          ),
          DrawerItem(
            name: 'Home',
            icon: Icons.home,
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          DrawerItem(
            name: 'Invoices',
            icon: Icons.inventory_outlined,
            onPressed: () {},
          ),
          DrawerItem(
            name: 'Analytics',
            icon: Icons.analytics,
            onPressed: () {
              Navigator.of(context).pushNamed('/analytics');
            },
          ),
          DrawerItem(
            name: 'Account',
            icon: Icons.person,
            onPressed: () {
              Navigator.of(context).pushNamed('/profile');
            },
          ),
          DrawerItem(
            name: 'Analytics',
            icon: Icons.analytics,
             onPressed: () async {
              await Provider.of<AuthProvider>(context, listen: false)
                  .currentUser();
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 22),
            child: const Divider(
              thickness: 1,
              height: 10,
              color: Colors.grey,
            ),
          ),
          DrawerItem(
            name: 'Settings',
            icon: Icons.settings,
            onPressed: () async {
              await Provider.of<AuthProvider>(context, listen: false)
                  .getidTokenFromPreferences;
            },
          ),
          DrawerItem(
            name: 'Logout',
            icon: Icons.logout_outlined,
            onPressed: () async {
              await Provider.of<AuthProvider>(context, listen: false)
                  .signOut(context);
            },
          ),
        ],
      ),
    );
  }
}
