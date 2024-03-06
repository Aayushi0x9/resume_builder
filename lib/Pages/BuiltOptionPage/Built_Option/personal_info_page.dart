import 'package:flutter/material.dart';
import 'package:resume_builder/Components/text.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

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
            icon: Icon(Icons.arrow_back_ios)),
        title: const Text('Personal Info Page'),
        centerTitle: true,
        backgroundColor: Colors.teal.withOpacity(0.7),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('First Name'),
            textfill(context: context, name: 'Eg. Aayushi', size: size)
          ],
        ),
      ),
    );
  }
}
