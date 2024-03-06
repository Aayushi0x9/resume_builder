import 'package:flutter/material.dart';
import 'package:resume_builder/utils/rout_utils.dart';

import 'Pages/BuiltOptionPage/Built_Option/personal_info_page.dart';
import 'Pages/BuiltOptionPage/build_option_page.dart';
import 'Pages/HomePage/home_page.dart';
import 'Pages/SplashPage/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.splashScreen: (context) => const SplashScreen(),
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.buildOptionPage: (context) => const BuildOptionsPage(),
        MyRoutes.buildOptions[0]['route']: (context) =>
            const PersonalInfoPage(),
      },
    );
  }
}
