import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:deen/core/utils/appaudios/appaudio.dart';
import 'package:deen/core/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

// ignore: must_be_immutable
class TestPage extends StatefulWidget {
  TestPage({super.key, required this.question});
  List<Questions> question;
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<Questions> questions = [];
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  bool showFeedback = false;
  int? selectedIndex;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  void initState() {
    super.initState();
    _restartQuiz(widget.question);
  }

  void _checkAnswer(int selectedOptionIndex) {
    if (selectedIndex != null) return; // Prevent multiple selections

    setState(() {
      selectedIndex = selectedOptionIndex;
      if (selectedIndex == questions[currentQuestionIndex].answer) {
        correctAnswers++;
      }
    });

    String soundPath = selectedIndex == questions[currentQuestionIndex].answer
     ?Quizaudio.correct:Quizaudio.tryagian;

    audioPlayer.play(AssetSource(soundPath)).catchError((e) {
      if (kDebugMode) {
        print("Error loading sound: $e");
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        selectedIndex = null;
      } else {
        _showFinalScore(context);
      }
    });
  }

  void _restartQuiz(List<Questions> newQuestions) {
    setState(() {
      currentQuestionIndex = 0;
      correctAnswers = 0;
      selectedIndex = null;

      newQuestions.shuffle(Random());
      questions = newQuestions.take(10).toList();
    });
  }

  void _showFinalScore(BuildContext context) {
    Dialogs.materialDialog(
      color: Colors.white,
      msg: 'لقد حصلت علي $correctAnswers من ${questions.length} اجابه صحيحة!',
      title: 'انتهى الاختبار',
      lottieBuilder: Lottie.asset(
        'assets/Eslam/Animation - 1731919093770.json',
        fit: BoxFit.contain,
      ),
      customViewPosition: CustomViewPosition.BEFORE_ACTION,
      context: context,
      actions: [
        IconsButton(
          onPressed: () {
            Navigator.of(context).pop();
            _restartQuiz(widget.question);
          },
          text: 'اعادة الاختبار',
          iconData: Icons.refresh,
          color: Colors.blue,
          textStyle: const TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
        IconsButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          text: 'اغلاق',
          iconData: Icons.close,
          color: Colors.red,
          textStyle: const TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Questions currentQuestion = questions[currentQuestionIndex];

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F3FF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/Eslam/question2.jpg',
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: height * 0.4,
                      ),
                      Positioned(
                        top: height * 0.2,
                        right: width * 0.35,
                        child: SizedBox(
                          width: width * 0.4,
                          child: Text(
                            currentQuestion.question,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      currentQuestion.options.length,
                      (index) {
                        Color buttonColor = Colors.white;

                        if (selectedIndex != null) {
                          if (index == questions[currentQuestionIndex].answer) {
                            buttonColor = Colors.green; // Correct answer
                          } else if (index == selectedIndex) {
                            buttonColor = Colors.red; // Wrong answer
                          }
                        }

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: SizedBox(
                            width: width *
                                0.8, // Ensure same width for all buttons
                            child: ElevatedButton(
                              onPressed: () {
                                if (selectedIndex == null) {
                                  _checkAnswer(index);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: buttonColor,
                                foregroundColor: Colors.black,
                                side: const BorderSide(color: Colors.black),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.2),
                              ),
                              child: Text(
                                currentQuestion.options[index],
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: selectedIndex == null ? null : _nextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107),
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.3),
                    ),
                    child: const Text('السؤال التالي',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
