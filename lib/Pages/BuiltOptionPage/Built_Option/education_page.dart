import 'package:flutter/material.dart';
import 'package:resume_builder/Components/snackbar.dart';
import 'package:resume_builder/Pages/BuiltOptionPage/Built_Option/resume_builder/Component/build_input_field.dart';
import 'package:resume_builder/utils/global.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Education Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        titleSpacing: 1,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                buildInputField(
                  'Degree/Course',
                  Icons.percent,
                  'Eg. BBA, MBA,BCA, B.TECH..,ETC.',
                  (val) => Globals.globals.degree = val,
                  (val) => val!.isEmpty ? 'Must Enter Your Degree' : null,
                  initialValue: Globals.globals.degree,
                  keyboardType: TextInputType.name,
                ),
                buildInputField(
                  'School/College Name',
                  Icons.email_rounded,
                  'Eg. XYZ Univercity',
                  (val) => Globals.globals.college = val,
                  (val) => val!.isEmpty
                      ? 'Must Enter Your School/College Name'
                      : null,
                  initialValue: Globals.globals.college,
                  keyboardType: TextInputType.name,
                ),
                buildInputField(
                  'Percentage/CGPA',
                  Icons.share_location_rounded,
                  '###',
                  (val) => Globals.globals.percentage = val,
                  (val) =>
                      val!.isEmpty ? 'Must Enter Your Percentage/CGPA' : null,
                  initialValue: Globals.globals.percentage,
                  keyboardType: TextInputType.number,
                  // maxLines: 3,
                ),
                buildInputField(
                  'Passing Year',
                  Icons.phone_android_rounded,
                  'Eg. 2024',
                  (val) => Globals.globals.passing_year = val,
                  (val) => val!.isEmpty ? 'Must Enter Your Passing Year' : null,
                  initialValue: Globals.globals.passing_year,
                  keyboardType: TextInputType.none,
                  // maxLength: 10,
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        formKey.currentState!.reset();
                        Globals.globals.reset();
                        setState(() {});
                      },
                      child: const Text(
                        'Reset',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        bool validated = formKey.currentState!.validate();
                        if (validated) {
                          formKey.currentState!.save();
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          MySnackbar(
                            content: validated
                                ? 'Form Saved!!'
                                : 'Failed to Validate Form!!',
                            color: validated ? Colors.green : Colors.red,
                          ),
                        );
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
