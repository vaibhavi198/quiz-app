import 'package:flutter/material.dart';
import 'package:quiz_app/const/appStrings.dart';
import 'package:quiz_app/screens/screen%201.dart';

class Screen3 extends StatelessWidget {
  final int correctAnswersCount;
  final int incorrectAnswersCount;

  const Screen3({
    super.key,
    required this.correctAnswersCount,
    required this.incorrectAnswersCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.result),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Correct Answers: $correctAnswersCount'),
            Text('Incorrect Answers: $incorrectAnswersCount'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Screen1(),
                  ),
                );
              },
              child: const Text(AppStrings.playAgain),
            ),
          ],
        ),
      ),
    );
  }
}
