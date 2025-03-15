import 'package:flutter/material.dart';
import 'package:fpt_scoring/exam_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FPT Scoring'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return ExamScreen();
                },
              ),
            );
          },
          child: const Text('Start now'),
        ),
      ),
    );
  }
}
