import 'package:audioplayers/audioplayers.dart';
import 'package:deen/Models/mostof%20categorymodel.dart';
import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProphetsCard extends StatefulWidget {
  final Mostofcategorymodel categorymodel;

  const ProphetsCard({super.key, required this.categorymodel});

  @override
  _ProphetsCardState createState() => _ProphetsCardState();
}

class _ProphetsCardState extends State<ProphetsCard> {
  static AudioPlayer? _globalAudioPlayer; // Shared audio player across cards
  bool flag = false;

  void buttonAction(String soundPath) async {
    // Stop any currently playing audio
    if (_globalAudioPlayer != null) {
      await _globalAudioPlayer!.stop();
    }

    // Create new player or reuse existing one
    _globalAudioPlayer = AudioPlayer();
    await _globalAudioPlayer!.play(AssetSource(soundPath));
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
            Future.delayed(const Duration(milliseconds: 650), () {
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.categorymodel.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _globalAudioPlayer?.dispose();
    super.dispose();
  }
}
