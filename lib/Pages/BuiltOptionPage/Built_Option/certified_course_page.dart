import 'package:flutter/material.dart';

import '../../../utils/global.dart';

class CertifiedCoursePage extends StatefulWidget {
  const CertifiedCoursePage({super.key});

  @override
  State<CertifiedCoursePage> createState() => _CertifiedCoursePageState();
}

class _CertifiedCoursePageState extends State<CertifiedCoursePage> {
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
          'Certified Course',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        titleSpacing: 1,
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Certified Course',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListView.builder(
                shrinkWrap: true, // Adjusts ListView size to fit its children
                itemCount: Globals.globals.certifiedCourse.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.teal.shade50, // Start color
                                Colors.teal.shade100, // End color
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(3, 3),
                                blurRadius: 5,
                                spreadRadius: 2,
                              ),
                              BoxShadow(
                                color: Colors.white.withOpacity(0.7),
                                offset: const Offset(-3, -3),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: TextField(
                            controller:
                                Globals.globals.coursesController[index],
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    Globals.globals.certifiedCourse
                                        .removeAt(index);
                                    Globals.globals.coursesController
                                        .removeAt(index);
                                  });
                                },
                                icon: const Icon(Icons.delete),
                              ),
                              hintText: 'Eg. Master In Flutter',
                              hintStyle: const TextStyle(
                                fontSize: 12,
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      Globals.globals.certifiedCourse.add("");
                      Globals.globals.coursesController
                          .add(TextEditingController());
                    });
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add Certified Course"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
