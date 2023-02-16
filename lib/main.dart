import 'package:auth_app/common_widgets/bottom_menu.dart';
import 'package:auth_app/features/authentication/controllers/user_provider.dart';
import 'package:auth_app/features/authentication/screens/analytics_tabs.dart';
import 'package:auth_app/features/authentication/screens/drawer.dart';
import 'package:auth_app/features/authentication/screens/profile.dart';
import 'package:auth_app/features/authentication/screens/signin.dart';
import 'package:auth_app/features/authentication/screens/signup.dart';
import 'package:auth_app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/authentication/screens/home_splash.dart';
import 'features/authentication/screens/app_bar.dart';
import 'features/authentication/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            // When navigating to the "/second" route, build the SecondScreen widget.
            '/': (context) => const HomePage(),
            '/signin': (context) => const Signin(),
            '/signup': (context) => const Signin(),
            '/analytics': (context) => const AnalyticsTab(),
            '/profile': (context) => const Profile(),
          },
          darkTheme: MyAppTheme.darkTheme,
          theme: MyAppTheme.lightTheme,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
