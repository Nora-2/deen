import 'package:deen/core/utils/appvideos/appvideos.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Hadithnabwyscreen extends StatefulWidget {
  const Hadithnabwyscreen({super.key});

  @override
  State<Hadithnabwyscreen> createState() => _HadithnabwyscreenState();
}

class _HadithnabwyscreenState extends State<Hadithnabwyscreen> {
  List<YoutubePlayerController> _controllers = [];
  List<bool> _isPlayerReadyList = [];

  @override
  void initState() {
    super.initState();
    _controllers = Appvideos.hadith.map((videoLink) {
      String? videoId;
      try {
        videoId = YoutubePlayer.convertUrlToId(videoLink);
        if (videoId == null) {
          return YoutubePlayerController(
            initialVideoId:
                'dQw4w9WgXcQ', // Fallback, you can use an empty ID or error ID
            flags: const YoutubePlayerFlags(autoPlay: false, mute: true),
          );
        }
      } catch (e) {
        return YoutubePlayerController(
          initialVideoId: 'dQw4w9WgXcQ', // Fallback
          flags: const YoutubePlayerFlags(autoPlay: false, mute: true),
        );
      }

      return YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    }).toList();

    _isPlayerReadyList = List.generate(_controllers.length, (index) => false);

    for (var controller in _controllers) {
      controller.addListener(() {
        final index = _controllers.indexOf(controller);
        if (controller.value.isReady && !_isPlayerReadyList[index]) {
          setState(() {
            _isPlayerReadyList[index] = true;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حديث نبوي'),
      ),
      body: ListView.builder(
        itemCount: Appvideos.hadith.length,
        itemBuilder: (context, index) {
          // final videoLink = Appvideos.hadith[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: _controllers[index],
                      showVideoProgressIndicator: true,
                    ),
                    builder: (context, player) {
                      return SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: player,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
