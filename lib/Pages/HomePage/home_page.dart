import 'package:flutter/material.dart';
import 'package:resume_builder/utils/rout_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HomePage',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        titleSpacing: 1,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(
          context,
          MyRoutes.buildOptionPage,
        ),
        label: const Text("Create"),
        icon: const Icon(Icons.add),
      ),
      body: const Center(
          child: Text(
        'Oops!! 😓 Any Resume is Not Created...',
        style: TextStyle(
            fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
      )),
    );
  }
}
