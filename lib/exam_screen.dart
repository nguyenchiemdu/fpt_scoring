import 'package:flutter/material.dart';
import 'package:fpt_scoring/api/api_services.dart';
import 'package:fpt_scoring/result_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> with WidgetsBindingObserver {
  final module = RegisterModuleImpl();
  String? question;

  final TextEditingController answerController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    getRandomQuestion();
  }

  void getRandomQuestion() async {
    final response = await module.apiService.getRandomQuestion();

    setState(() {
      question = response.question;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      getRandomQuestion();
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
      body: question == null
          ? Center(
              child: LoadingAnimationWidget.threeRotatingDots(
                size: 50,
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          : Center(
              child: Column(
                children: [
                  Text(
                    question!,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 60),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Answer',
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: answerController,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return ResultScreen(
                              question: question!,
                              answer: answerController.text,
                            );
                          },
                        ),
                      );
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
    );
  }
}
