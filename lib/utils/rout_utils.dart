import 'package:flutter/material.dart';

class MyRoutes {
  static String splashScreen = '/';
  static String homePage = 'home_page';
  static String buildOptionPage = 'build_option_page';

  static List buildOptions = [
    {
      'title': 'Personal info',
      'route': 'personal_info',
      'icon': Icons.person,
    },
    {
      'title': 'Education',
      'route': 'education',
      'icon': Icons.school,
    },
    {
      'title': 'Experience',
      'route': 'experience',
      'icon': Icons.work,
    },
    {
      'title': 'Certified courses',
      'route': 'certified_courses',
      'icon': Icons.card_membership,
    },
    {
      'title': 'Projects',
      'route': 'projects',
      'icon': Icons.folder,
    },
    {
      'title': 'Technical skills',
      'route': 'technical_skills',
      'icon': Icons.build,
    },
    {
      'title': 'Hobbies',
      'route': 'hobbies',
      'icon': Icons.palette,
    },
    {
      'title': 'About',
      'route': 'about',
      'icon': Icons.info,
    },
    {
      'title': 'Achievements',
      'route': 'achievements',
      'icon': Icons.emoji_events,
    },
  ];
}
