import 'package:final_iti/features/developer/data/developer_model.dart';
import 'package:final_iti/features/developer/presentation/widgets/developer_iteam.dart';

import 'package:flutter/material.dart';

class DeveloperPage extends StatelessWidget {
  DeveloperPage({super.key});
  final DeveloperModel developer = DeveloperModel(
      url: "assets/kawther.jpg",
      name: "Kawther Walid",
      track: "Flutter Developer",
      email: "kawtherwalid130@gmail.com");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEF6494),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "App Developer",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
                width: 400,
                height: 400,
                child: DeveloperIteam(
                  developer: developer,
                ))
          ],
        ),
      ),
    );
  }
}
