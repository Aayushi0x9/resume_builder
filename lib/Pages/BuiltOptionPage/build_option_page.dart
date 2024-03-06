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
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Build Options'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: MyRoutes.buildOptions
                .map(
                  (e) => Card(
                    color: Colors
                        .primaries[MyRoutes.buildOptions.indexOf(e) % 18]
                        .withOpacity(0.3),
                    borderOnForeground: true,
                    shadowColor: Colors.grey,
                    child: ListTile(
                      title: Text(e['title']),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, e['route']);
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
