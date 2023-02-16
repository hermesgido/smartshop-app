import 'package:auth_app/features/authentication/screens/home_page.dart';
import 'package:auth_app/features/authentication/screens/signin.dart';
import 'package:auth_app/features/authentication/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:pandabar/pandabar.dart';

import '../features/authentication/screens/analytics.dart';
import '../features/authentication/screens/analytics_screen.dart';
import '../features/authentication/screens/analytics_tabs.dart';

class BottomMenu extends StatefulWidget {
  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  String page = 'Grey';

  @override
  Widget build(BuildContext context) {
    return PandaBar(
      fabColors: const [
        Color.fromRGBO(68, 207, 152, 1.0),
        Color.fromRGBO(68, 207, 152, 1.0)
      ],
      fabIcon: const Icon(
        Icons.add,
      ),
      buttonSelectedColor: const Color.fromRGBO(68, 207, 152, 1.0),
      buttonData: [
        PandaBarButtonData(id: 'Grey', icon: Icons.dashboard, title: 'Home'),
        PandaBarButtonData(id: 'Blue', icon: Icons.book, title: 'Analytics'),
        PandaBarButtonData(
            id: 'Red', icon: Icons.account_balance_wallet, title: 'Sales'),
        PandaBarButtonData(id: 'Yellow', icon: Icons.person, title: 'Account'),
      ],
      onChange: (id) {
        setState(() {
          page = id;
        });
      },
      onFabButtonPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SignUp(),
          ),
        );
      },
    );
    /*  body: Builder(
        builder: (context) {
          switch (page) {
            case 'Grey':
              return HomePage();
            case 'Blue':
              return Analytics();
            case 'Red':
              return AnalyticsTab();
            case 'Yellow':
              return Signin();
            default:
              return Container();
          }
        },
      ); */
  }
}
