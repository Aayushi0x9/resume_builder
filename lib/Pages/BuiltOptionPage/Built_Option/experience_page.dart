import 'package:flutter/material.dart';
import 'package:resume_builder/Components/snackbar.dart';
import 'package:resume_builder/Pages/BuiltOptionPage/Built_Option/resume_builder/Component/build_input_field.dart';
import 'package:resume_builder/exe.dart';
import 'package:resume_builder/utils/global.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String emp_status = 'previous_emp';
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
          'Experience',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildInputField(
                  'Company Name',
                  Icons.co_present,
                  'Eg. Google,Amazon...,etc. ',
                  (val) => Globals.globals.company_name = val,
                  (val) => val!.isEmpty ? 'Must Enter Your Company Name' : null,
                  initialValue: Globals.globals.company_name,
                  keyboardType: TextInputType.name,
                ),
                buildInputField(
                  'Job Profile',
                  Icons.email_rounded,
                  'Eg. Disigner,App Devloper...,etc.',
                  (val) => Globals.globals.work_profile = val,
                  (val) => val!.isEmpty
                      ? 'Must Enter Your School/College Name'
                      : null,
                  initialValue: Globals.globals.college,
                  keyboardType: TextInputType.name,
                ),
                buildInputField(
                  'Roles(Opation)',
                  Icons.phone_android_rounded,
                  'Eg. Working with team members to come up with the new cocepts and product analysis',
                  (val) => Globals.globals.passing_year = val,
                  (val) => val!.isEmpty ? 'Must Enter Your Passing Year' : null,
                  initialValue: Globals.globals.passing_year,
                  keyboardType: TextInputType.multiline,
                  maxLength: 250,
                  maxLines: 3,
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Text(
                  'Employee Status',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                10.ofHeight,
                RadioListTile(
                  title: Text('Previous Employee'),
                  value: 'previous_emp',
                  groupValue: emp_status,
                  onChanged: (val) {
                    setState(() {
                      emp_status = val!;
                      Globals.globals.employe_status = val;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Currently Employee'),
                  value: 'currently_emp',
                  groupValue: emp_status,
                  onChanged: (val) {
                    setState(() {
                      emp_status = val!;
                      Globals.globals.employe_status = val;
                    });
                  },
                ),
                10.ofHeight,
                Row(
                  children: [
                    Expanded(
                      child: buildInputField(
                        'Start Year',
                        Icons.calendar_today,
                        'Select start year',
                        (val) => Globals.globals.start_year = val,
                        (val) =>
                            val!.isEmpty ? 'Must Enter Your Start year' : null,
                        initialValue: Globals().start_year != null
                            ? Globals().start_year.toString()
                            : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: buildInputField(
                        'End Year',
                        Icons.calendar_today,
                        'Select end year',
                        (val) => Globals().end_year = val,
                        (val) =>
                            val!.isEmpty ? 'Must Enter Your End Year' : null,
                        initialValue: Globals().end_year != null
                            ? Globals().end_year.toString()
                            : null,
                      ),
                    ),
                  ],
                ),
                10.ofHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        formKey.currentState!.reset();
                        Globals.globals.reset();
                        setState(() {
                          emp_status = 'previous_emp';
                        });
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
