import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fpt_scoring/result_screen.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> with WidgetsBindingObserver {
  final questions = [
    'What is the capital of France?',
    'What is the capital of Germany?',
    'What is the capital of Italy?',
  ];

  late var currentQuestionIndex = Random().nextInt(questions.length);

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      var newIndex = Random().nextInt(questions.length);

      while (newIndex == currentQuestionIndex) {
        newIndex = Random().nextInt(questions.length);
      }

      setState(() {
        currentQuestionIndex = newIndex;
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FPT Scoring'),
        ),
        body: Center(
            child: Column(
          children: [
            Text(
              questions[currentQuestionIndex],
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 60),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Answer',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return const ResultScreen();
                    },
                  ),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        )));
  }
}
