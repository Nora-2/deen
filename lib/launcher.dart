import 'package:deen/Features/learn/views/learnscreen.dart';
import 'package:deen/Features/quiz/views/test.dart';
import 'package:deen/Features/video/views/videoscreen.dart';
import 'package:deen/core/utils/constants.dart';
import 'package:flutter/material.dart';
import '../Components/navigator_custom.dart';

class LauncherPage extends StatefulWidget {
  const LauncherPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  //!list of screens
  List<Widget> screens = [
    Learnscreen(),
    Videoscreen(),
    TestPage(question: ques),
  ];

  int screen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[screen],
      bottomNavigationBar: NavigatioBarCustom(
        indexpage: screen,
        onPress: (value) {
          setState(() {
            screen = value;
          });
        },
      ),
    );
  }
}
