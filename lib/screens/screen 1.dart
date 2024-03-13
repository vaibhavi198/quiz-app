import 'package:flutter/material.dart';
import 'package:quiz_app/const/appStrings.dart';
import 'package:quiz_app/screens/screen%202.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.quizApp),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Screen2()));
          },
          child: const Text(AppStrings.playGame),
        ),
      ),
    );
  }
}
