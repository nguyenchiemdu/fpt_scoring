import 'package:flutter/material.dart';
import 'package:fpt_scoring/api/api_services.dart';
import 'package:fpt_scoring/api/response/submit_exam_response.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    required this.question,
    required this.answer,
    super.key,
  });

  final String question;
  final String answer;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final module = RegisterModuleImpl();
  SubmitExamResponse? result;

  @override
  void initState() {
    super.initState();
    submitResult();
  }

  void submitResult() async {
    final response = await module.apiService.submitExam(
      question: widget.question,
      answer: widget.answer,
    );

    setState(() {
      result = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FPT Scoring'),
      ),
      body: Center(
        child: result == null
            ? LoadingAnimationWidget.threeRotatingDots(
                size: 50,
                color: Theme.of(context).colorScheme.primary,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    result!.correctAnswer,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    result!.score,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Try again'),
                  ),
                ],
              ),
      ),
    );
  }
}
