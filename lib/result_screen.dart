import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  var isLoading = true;
  var score =
      (50 + (100 - 50) * (DateTime.now().millisecondsSinceEpoch % 100) / 100)
          .toInt();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FPT Scoring'),
      ),
      body: Center(
        child: isLoading
            ? LoadingAnimationWidget.threeRotatingDots(
                size: 50,
                color: Theme.of(context).colorScheme.primary,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You scored $score out of 100",
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
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
