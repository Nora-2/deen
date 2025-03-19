import 'package:audioplayers/audioplayers.dart';
import 'package:deen/Models/mostof%20categorymodel.dart';
import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CategoriesCard extends StatefulWidget {
  const CategoriesCard({super.key, required this.categorymodel});

  final Mostofcategorymodel categorymodel;

  @override
  _CategoriesCardState createState() => _CategoriesCardState();
}

class _CategoriesCardState extends State<CategoriesCard> {
  static AudioPlayer? _globalAudioPlayer; // Static to track global audio player
  AudioPlayer audioPlayer = AudioPlayer();
  bool flag = false;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void buttonAction(String soundPath) async {
    // Stop the currently playing audio if any
    if (_globalAudioPlayer != null) {
      await _globalAudioPlayer!.stop();
    }

    // Assign the current player as the global player
    _globalAudioPlayer = audioPlayer;
    
    // Play the new audio
    await audioPlayer.play(AssetSource(soundPath));
  }

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      position: 0,
      columnCount: 2,
      child: ShakeAnimatedWidget(
        enabled: flag,
        duration: const Duration(milliseconds: 150),
        shakeAngle: Rotation.deg(z: 10),
        curve: Curves.bounceInOut,
        child: GestureDetector(
          onTap: () {
            buttonAction(widget.categorymodel.sound);
            setState(() {
              flag = true;
            });
            Future.delayed(const Duration(milliseconds: 300), () {
              setState(() => flag = false);
            });
          },
          child: AnimatedScale(
            scale: flag ? 1.1 : 1.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(widget.categorymodel.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
