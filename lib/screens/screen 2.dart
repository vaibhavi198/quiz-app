import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app/const/appStrings.dart';
import 'package:quiz_app/screens/screen3.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  int _currentTimerValue = 60;
  bool _isTimerRunning = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _isTimerRunning = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_currentTimerValue > 0) {
          _currentTimerValue--;
        } else {
          _stopTimer();
        }
      });
    });
  }

  void _stopTimer() {
    _timer.cancel();
    setState(() {
      _isTimerRunning = false;
    });
  }

  List<String> questionList = [
    "1. Who is the Prime Minister of India?",
    "2.What is the capital of India?",
    "3. What is sum of 15 + 25 ?",
    "4. Which one is maximum? 25, 11, 17, 18, 40, 42",
    "5.What is the official language of Gujarat",
    "6.What is multiplication of 12 * 12 ?",
    "7.Which state of India has the largest population?",
    "8. Who is the Home Minister of India?",
    "9. What is the capital of Gujarat?",
    "10.  Which number will be next in series? 1, 4, 9, 16, 25",
    "11.  Which one is minimum? 5, 0, -20, 11",
    "12.  What is sum of 10, 12 and 15?",
    "13.  What is the official language of the Government of India?",
    "14.  Which country is located in Asia?",
    "15. Which language(s) is/are used for Android app development?",
  ];

  List<List<String>> options = [
    [
      "a) Narendra Modi",
      "b)Rahul Gandhi",
      "c)Manmohan Singh",
      "d)Amit Shah",
    ],
    [
      "a)Mumbai",
      "b)Chennai",
      "c)Delhi",
      "d)Ahmedabad",
    ],
    [
      "a) 5",
      "b) 25",
      "c) 40",
      "d) None",
    ],
    [
      "a)11",
      "b)42",
      "c)17",
      "d)None",
    ],
    [
      "a)Hindi",
      "b)Gujarati",
      "c)Marathi",
      "d)None",
    ],
    [
      "a)124",
      "b)12",
      "c)24",
      "d)None",
    ],
    [
      "a) UP",
      "b)Bihar",
      "c)Gujarat",
      "d)Maharashtra",
    ],
    [
      "a)Amit Shah",
      "b)Rajnath Signh",
      "c)Narendra Modi",
      "d)None",
    ],
    [
      "a)Vadodara",
      "b)Ahmedabad",
      "c)Gandhinagar",
      "d)Rajkot",
    ],
    [
      "a) 21",
      "b) 36",
      "c) 49",
      "d) 32",
    ],
    [
      "a) 0",
      "b) 11",
      "c) -20",
      "d) None",
    ],
    [
      "a) 37",
      "b) 25",
      "c) 10",
      "d) 12",
    ],
    [
      "a) Hindi",
      "b) English",
      "c) Gujarati",
      "d) None",
    ],
    [
      "a) India",
      "b) USA",
      "c) UK",
      "d) None",
    ],
    [
      "a) Java",
      "b) Java & Kotlin",
      "c) Kotlin",
      "d) Swift",
    ],
  ];

  List<int> correctAnswers = [0, 2, 2, 1, 1, 3, 0, 0, 2, 1, 2, 0, 0, 0, 1];

  List<int> selectedAnswers = [
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1
  ];

  int _correctAnswersCount = 0;
  int _incorrectAnswersCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 80),
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(AppStrings.score),
              Text(
                'Time Remaining: $_currentTimerValue seconds',
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: questionList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          questionList[index].toString(),
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Column(
                          children: List.generate(
                            options[index].length,
                            (optionIndex) => RadioListTile(
                              title: Text(options[index][optionIndex]),
                              value: optionIndex,
                              groupValue: selectedAnswers[index],
                              onChanged: (value) {
                                setState(() {
                                  selectedAnswers[index] = value!;
                                });
                              },
                              activeColor: selectedAnswers[index] ==
                                      correctAnswers[index]
                                  ? Colors.green
                                  : Colors.red,
                            ),
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
        ElevatedButton(
          onPressed: () {
            _navigateToNextScreen();
          },
          child: const Text(AppStrings.submit),
        ),
      ]),
    );
  }

  void _navigateToNextScreen() {
    for (int i = 0; i < questionList.length; i++) {
      if (selectedAnswers[i] == correctAnswers[i]) {
        _correctAnswersCount++;
      } else {
        _incorrectAnswersCount++;
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Screen3(
          correctAnswersCount: _correctAnswersCount,
          incorrectAnswersCount: _incorrectAnswersCount,
        ),
      ),
    );
  }
}
