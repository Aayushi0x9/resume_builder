import 'package:flutter/material.dart';
import 'package:resume_builder/utils/rout_utils.dart';

class BuildOptionsPage extends StatelessWidget {
  const BuildOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Build Options',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                itemCount: MyRoutes.buildOptions.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  // crossAxisSpacing: 10,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final option = MyRoutes.buildOptions[index];
                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001) // perspective
                      ..rotateX(0.1) // slight rotation to enhance 3D
                      ..rotateY(-0.1),
                    alignment: FractionalOffset.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, option['route']);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 16, top: 16, left: 16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.grey.shade300,
                              Colors.grey.shade100
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(5, 5),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: Colors.white.withOpacity(0.7),
                              offset: const Offset(-3, -3),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              option['icon'],
                              size: 40,
                              color: Colors.teal,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              option['title'],
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
            ),
          ),
        ],
      ),
    );
  }
}
