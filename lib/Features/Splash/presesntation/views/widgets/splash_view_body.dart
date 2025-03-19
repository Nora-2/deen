// ignore_for_file: unnecessary_overrides

import 'package:arabic_font/arabic_font.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:deen/core/utils/app_router.dart';
import 'package:deen/core/utils/appaudios/appaudio.dart';
import 'package:deen/core/utils/appimage/app_images.dart';
import 'package:deen/core/utils/appstring/app_string.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
    player.play(AssetSource(Appaudio.intro));
    navigateToHome();
  }

  @override
  dispose() {
    super.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        WidgetAnimator(
          incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(),
          child: Image.asset(
            Appimage.splach,
            height: 300,
          ),
        ),
        Center(
          child: Text(
            textDirection: TextDirection.rtl,
            Appstring.splach,
            style: ArabicTextStyle(
                arabicFont: ArabicFont.amiri,
                fontSize: 30,
                color: Colors.black),
          ),
        ),
      ],
    );
  }

  void navigateToHome() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        GoRouter.of(context).pushReplacement(AppRouter.kLauncherView);
      },
    );
  }
}
