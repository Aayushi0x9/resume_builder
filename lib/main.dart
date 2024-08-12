import 'package:flutter/material.dart';
import 'package:resume_builder/Pages/BuiltOptionPage/Built_Option/about_page.dart';
import 'package:resume_builder/Pages/BuiltOptionPage/Built_Option/achievements_page.dart';
import 'package:resume_builder/Pages/BuiltOptionPage/Built_Option/certified_course_page.dart';
import 'package:resume_builder/Pages/BuiltOptionPage/Built_Option/education_page.dart';
import 'package:resume_builder/Pages/BuiltOptionPage/Built_Option/experience_page.dart';
import 'package:resume_builder/Pages/BuiltOptionPage/Built_Option/hobbies_page.dart';
import 'package:resume_builder/Pages/BuiltOptionPage/Built_Option/projects_page.dart';
import 'package:resume_builder/Pages/BuiltOptionPage/Built_Option/technical_skills_page.dart';
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
        MyRoutes.buildOptions[1]['route']: (context) => const EducationPage(),
        MyRoutes.buildOptions[2]['route']: (context) => const ExperiencePage(),
        MyRoutes.buildOptions[3]['route']: (context) =>
            const CertifiedCoursePage(),
        MyRoutes.buildOptions[4]['route']: (context) => const ProjectsPage(),
        MyRoutes.buildOptions[5]['route']: (context) => const TechnicalSkills(),
        MyRoutes.buildOptions[6]['route']: (context) => const HobbiesPage(),
        MyRoutes.buildOptions[7]['route']: (context) => const AboutPage(),
        MyRoutes.buildOptions[8]['route']: (context) =>
            const AchievementsPage(),
      },
    );
  }
}
