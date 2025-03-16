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
      body: SafeArea(
        child: Center(
          child: result == null
              ? LoadingAnimationWidget.threeRotatingDots(
                  size: 50,
                  color: Theme.of(context).colorScheme.primary,
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 4,
                        margin: const EdgeInsets.all(16),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Question:',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.question,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Your Answer:',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.answer,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Correct Answer:',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                result!.correctAnswer,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Score:',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                result!.score,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
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
        ),
      ),
    );
  }
}
