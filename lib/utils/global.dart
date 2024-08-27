import 'dart:io';

import 'package:flutter/material.dart';

class Globals {
  //PersonalInfo
  String? name, email, address, password, contact;
  File? image;
  String? gender;

  //Education
  String? degree, passing_year, college, percentage;

  //Experience
  String? company_name,
      work_profile,
      role,
      employe_status,
      start_year,
      end_year;

  //Certified Course
  List certifiedCourse = ['', ''];
  List<TextEditingController> coursesController = [
    TextEditingController(),
    TextEditingController(),
  ];

  static final Globals globals = Globals();

  void reset() {
    name = contact = email = password = address = null;
  }
}
